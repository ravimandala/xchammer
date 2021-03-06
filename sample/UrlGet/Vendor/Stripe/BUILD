load("//Vendor/rules_pods/BazelExtensions:extensions.bzl", "pch_with_name_hint")
load("//Vendor/rules_pods/BazelExtensions:extensions.bzl", "acknowledged_target")
load("//Vendor/rules_pods/BazelExtensions:extensions.bzl", "gen_module_map")

# Add a config setting release for compilation mode
# Assume that people are using `opt` for release mode
# see the bazel user manual for more information
# https://bazel.build/versions/master/docs/bazel-user-manual.html
native.config_setting(
    name = "release",
    values = {
        "compilation_mode": "opt",
    },
)

config_setting(
    name = "iosCase",
    values = {
        "cpu": "powerpc1",
    },
)

filegroup(
    name = "Stripe_hdrs",
    srcs = glob(
        [
            "pod_support/Headers/Public/**/*",
        ],
        exclude_directories = 1,
    ),
    visibility = [
        "//visibility:public",
    ],
)

gen_module_map(
    "Stripe",
    "Stripe_module_map",
    "Stripe",
    [
        "Stripe_hdrs",
    ],
)

objc_library(
    name = "Stripe",
    srcs = glob(
        [
            "Stripe/*.m",
        ],
        exclude_directories = 1,
    ) + glob(
        [
            "Stripe/*.h",
            "Stripe/PublicHeaders/*.h",
        ],
        exclude_directories = 1,
    ),
    hdrs = [
        ":Stripe_hdrs",
    ],
    bundles = select(
        {
            "//conditions:default": [
                ":Stripe_Bundle_Stripe",
            ],
        },
    ),
    copts = [
        "-Wno-everything",
        "-Wnon-modular-include-in-framework-module",
        "-g",
        "-stdlib=libc++",
        "-DCOCOAPODS=1",
        "-DOBJC_OLD_DISPATCH_PROTOTYPES=0",
        "-fdiagnostics-show-note-include-stack",
        "-fno-common",
        "-fembed-bitcode-marker",
        "-fmessage-length=0",
        "-fpascal-strings",
        "-fstrict-aliasing",
        "-Wno-error=nonportable-include-path",
    ] + select(
        {
            "//conditions:default": [
                "-DPOD_CONFIGURATION_RELEASE=0",
            ],
            ":release": [
                "-DPOD_CONFIGURATION_RELEASE=1",
                "-DNS_BLOCK_ASSERTIONS=1",
            ],
        },
    ) + [
        "-IVendor/Stripe/pod_support/Headers/Public/Stripe/",
    ] + [
        "-fmodule-name=Stripe_pod_module",
    ],
    enable_modules = 1,
    includes = [
        "Stripe_module_map",
        "pod_support/Headers/Public/",
    ],
    pch = pch_with_name_hint(
        "Stripe",
        [
            "Stripe/**/*.pch",
        ],
    ),
    sdk_frameworks = [
        "Foundation",
        "Security",
        "WebKit",
        "PassKit",
        "Contacts",
        "CoreLocation",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        ":Stripe_Bundle_Stripe",
    ],
)

acknowledged_target(
    name = "Stripe_acknowledgement",
    value = "//Vendor/Stripe/pod_support_buildable:acknowledgement_fragment",
    deps = [
    ],
)

objc_bundle_library(
    name = "Stripe_Bundle_Stripe",
    resources = select(
        {
            "//conditions:default": glob(
                [
                    "Stripe/Resources/**/*",
                ],
                exclude_directories = 1,
            ),
        },
    ),
)

acknowledged_target(
    name = "Stripe_Bundle_Stripe_acknowledgement",
    value = "//Vendor/Stripe/pod_support_buildable:acknowledgement_fragment",
    deps = [
    ],
)
