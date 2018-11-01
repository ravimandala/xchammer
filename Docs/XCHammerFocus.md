# XCFocus

XCFocus is an experimental Xcode experience to make Xcode work better with a
large project. Support for XCFocus is also the immediate next steps for the
XCHammer project.

## Preface

The large size of the Pinterest iOS code base has exceeded the limits of
efficient operation in a normal Xcode project. The point of XCHammer was
originally to produce a pure Xcode project.

Generally, a large Xcode project is required to index and compile all of the
sources. When the project gets large, e.g. at Pinterest, the cost of indexing
and building grows, and ends up slowing down development. XCFocus improves the
situation by removing unnecessary source files from Xcode and relies heavily on
Bazel for caching and faster builds. 

### Goals and differences

- Less source files: project generation time is several times faster.

- Indefinite caching: build artifacts are cached across builds, so branch
  switching is faster. e.g. cocoapod dependencies are rarely rebuilt on device,
  and there is no additional system required to achieve this.

- Optional generation: the Xcode project doesn't have to be regenerated and will
  not stop the build.

### Configuration

XCFocus is configured in XCHammer via an additional `XCHammerConfig`, in
addition to the default `XCHammer.yaml`. Through the `paths` attribute, projects
may be scoped down to to include a subset of files. Xcode build schemes are
disabled by flipping `generateXcodeSchemes` to `false`.

## Usage instructions

- generate projects via XCHammer

- open the `Focus.xcodeproj` or for workspace mode, an entirely separate
  workspace `.xcworkspace`, `Focus.xcworkspace`.

- easily switch between `Focus` and non `Focus`. Build results are shared
  through Bazel by default.

### Known issues

- Xcode progress bar doesn't work ( see future research )

- Indexing can have issues / be invalidated after builds  TODO: Add github issue

### Future research / Roadmap

- Local development instrumentation APIs: APIs are added to XCHammer to
  instrument local developer metrics like project generation time and build
  time.

- Fast bisecting / Top Hatting / PR Rewiew: The Xcode project downloads
  pre-built artifacts from CI pipelines to make testing PRs and bisecting
  easier. _CI integration ends up in either the XCHammer repostiory or external
  repositories to open source workflows for Buildkite or other CI systems._

- Project caching: XCHammer downloads pre-compiled projects from CI and
  additionally caches projects across branch switching. The cache system is
  built ontop of existing bazel caches. [Having the option to build projects
  with Bazel](https://github.com/pinterest/xchammer/issues/26) is tangentially
  related.

- Remote execution: The Macbook product line has limited build performance for
  large applications. Compilation is delegated to machines with a high core
  count and fast i/o.

- Progress bar integration: Xcode is made aware of Bazel's progress and it's
  rendered into the UI

- Hybrid Xcode / Bazel builds. Xcode build targets gain the ability to build
  dependencies via Bazel.

