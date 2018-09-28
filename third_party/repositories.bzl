load("@bazel_tools//tools/build_defs/repo:git.bzl", 
     "git_repository",
     "new_git_repository")


NAMESPACE_PREFIX = "" # TODO(rmalik) add namespace to avoid collisions from consumers

def namespaced_name(name):
   return NAMESPACE_PREFIX + name

def namespaced_new_git_repository(name, **kwargs):
   new_git_repository(
       name = namespaced_name(name),
       **kwargs
   )

def namespaced_git_repository(name, **kwargs):
   git_repository(
       name = namespaced_name(name),
       **kwargs
   )

def xchammer_dependencies():
    """Fetches repositories that are dependencies of the xchammer workspace.

    Users should call this macro in their `WORKSPACE` to ensure that all of the
    dependencies of xchammer are downloaded and that they are isolated from
    changes to those dependencies.
    """

    namespaced_new_git_repository(name = "AEXML",
      remote = "https://github.com/tadija/AEXML.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "AEXML",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "AEXML",
)
""",
      commit = "54bb8ea6fb693dd3f92a89e5fcc19e199fdeedd0")

    namespaced_new_git_repository(name = "Commandant",
      remote = "https://github.com/Carthage/Commandant.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Commandant",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "Commandant",
    deps = [
      "@Result//:Result"
   ]
)
""",
      commit = "07cad52573bad19d95844035bf0b25acddf6b0f6")

    namespaced_new_git_repository(name = "Commander",
      remote = "https://github.com/kylef/Commander.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Commander",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "Commander",
)
""",
      commit = "e5b50ad7b2e91eeb828393e89b03577b16be7db9")

    namespaced_new_git_repository(name = "JSONUtilities",
      remote = "https://github.com/yonaskolb/JSONUtilities.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "JSONUtilities",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "JSONUtilities",
)
""",
      commit = "d9f957b1b2a078c93f96c723040d4cbffcb7d3f9")

    namespaced_new_git_repository(name = "Nimble",
      remote = "https://github.com/Quick/Nimble.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Nimble",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "Nimble",
)
""",
      commit = "cd6dfb86f496fcd96ce0bc6da962cd936bf41903")

    namespaced_new_git_repository(name = "PathKit",
      remote = "https://github.com/kylef/PathKit.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "PathKit",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "PathKit",
)
""",
      commit = "e2f5be30e4c8f531c9c1e8765aa7b71c0a45d7a0")

    namespaced_new_git_repository(name = "Quick",
      remote = "https://github.com/Quick/Quick.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Quick",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "Quick",
)
""",
      commit = "5fbf13871d185526993130c3a1fad0b70bfe37ce")

    namespaced_new_git_repository(name ="Rainbow",
      remote = "https://github.com/onevcat/Rainbow.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Rainbow",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "Rainbow",
)
""",
      commit = "797a68d0a642609424b08f11eb56974a54d5f6e2")

    namespaced_new_git_repository(name = "Result",
      remote = "https://github.com/antitypical/Result.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Result",
    srcs = glob(["Result/**/*.swift"]),
    module_name = "Result",
)
""",
      commit = "8fc088dcf72802801efeecba76ea8fb041fb773d")

    namespaced_new_git_repository(name = "ShellOut",
      remote = "https://github.com/JohnSundell/ShellOut.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "ShellOut",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "ShellOut",
)
""",
    commit = "f1c253a34a40df4bfd268b09fdb101b059f6d52d")

    namespaced_new_git_repository(name = "Spectre",
      remote = "https://github.com/kylef/Spectre.git",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Spectre",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "Spectre",
)
""",
      commit = "f14ff47f45642aa5703900980b014c2e9394b6e5")

    namespaced_git_repository(
     name = "Tulsi",
     remote = "https://github.com/pinterest/Tulsi.git",
     commit = "e3c0dcb9dda0dc191034c061fdd4f0e4397ad527",
     patch_cmds = [
         """
         sed -i '' 's/\:__subpackages__/visibility\:public/g' src/TulsiGenerator/BUILD
         """,
         """
         sed -i '' 's/RunLoopMode\.defaultRunLoopMode/RunLoop\.Mode\.`default`/g' src/TulsiGenerator/ProcessRunner.swift
         """
         ]
    )


    namespaced_new_git_repository(name = "XcodeGen",
      remote = "https://github.com/yonaskolb/XcodeGen.git",
      commit = "6ae4a9fc3b54ae4205618f22b6a734558a76ca20",
    build_file_content = """
package(default_visibility = ["//visibility:public"])

load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "XcodeGenKit",
    srcs = glob(["Sources/XcodeGenKit/**/*.swift"]),
    module_name = "XcodeGenKit",
    deps = [
      ":ProjectSpec",
      "@JSONUtilities//:JSONUtilities",
      "@PathKit//:PathKit",
      "@Yams//:Yams"
    ]
)

swift_library(
    name = "ProjectSpec",
    srcs = glob(["Sources/ProjectSpec/**/*.swift"]),
    module_name = "ProjectSpec",
    deps = [
      "@JSONUtilities//:JSONUtilities",
      "@xcproj//:xcproj",
      "@Yams//:Yams"
    ]
)
"""
    )

    namespaced_new_git_repository(name = "xcproj",
      remote = "https://github.com/tuist/xcodeproj.git",
      commit = "5253c22f208558264e3a64a3a29f11537ca1b41a",
    build_file_content = """
package(default_visibility = ["//visibility:public"])
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "xcproj",
    srcs = glob(["Sources/**/*.swift"]),
    module_name = "xcproj",
    deps = [
       "@AEXML//:AEXML",
       "@PathKit//:PathKit"
    ]
)
"""
    )

    namespaced_new_git_repository(name = "Yams",
      remote = "https://github.com/jpsim/Yams.git",
     commit = "26ab35f50ea891e8edefcc9d975db2f6b67e1d68",
                           patch_cmds = [
      """
    echo '
    module CYaml {
        umbrella header "CYaml.h"
        export *
    }
    ' > Sources/CYaml/include/Yams.modulemap
      """
      ],
    build_file_content = """
load(
    "@build_bazel_rules_swift//swift:swift.bzl",
    "swift_c_module",
    "swift_library"
)

cc_library(
  name = "CYamlLib",
  srcs = glob([
    "Sources/CYaml/src/*.c",
    "Sources/CYaml/src/*.h",
  ]),
  hdrs = glob([
    "Sources/CYaml/include/*.h",
  ]),
  includes = ["Sources/CYaml/include"],
  linkstatic = True
)

swift_c_module(
  name = "CYaml",
  deps = [":CYamlLib"],
  module_map = "Sources/CYaml/include/Yams.modulemap",
)

swift_library(
  name = "Yams",
  deps = [":CYaml"],
  cc_libs = [":CYamlLib"],
  srcs = glob(["Sources/Yams/*.swift"]),
  defines = ["SWIFT_PACKAGE"],
  module_name = "Yams",
  visibility = ["//visibility:public"],
)
"""
    )