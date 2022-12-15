# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

See also the [CHANGELOG](https://github.com/cucumber/cucumber-jvm/blob/main/CHANGELOG.md) from Cucumber Core.

----
## [Unreleased] (In Git)

### Added

### Changed

### Deprecated

### Removed

### Fixed

## [6.10.4] (2021-06-14)

### Added

### Changed

### Deprecated

### Removed

### Fixed

## [6.1.2] (2021-01-01)

## [6.1.1] (2020-11-19)

## [5.1.3] (2020-05-28)

### Added 

- Added support for annotation based transformers configuration ([glib-briia](https://github.com/glib-briia))
- Added support for transposed datatables ([glib-briia](https://github.com/glib-briia))
- Added support for automated changelog generation/version update ([glib-briia](https://github.com/glib-briia))
- Added basic installation and usage documentation ([glib-briia](https://github.com/glib-briia))
- Added support for single implementation for multiple gherkin steps ([glib-briia](https://github.com/glib-briia))

### Changed

- Extract groovy script for keywords generation from pom ([glib-briia](https://github.com/glib-briia))
- Migrated to use  `cucumber-core` 5.1.3 ([glib-briia](https://github.com/glib-briia))
- Bump jackson.version from 2.9.9 to 2.10.0 in /groovy [\#18](https://github.com/cucumber/cucumber-jvm-groovy/pull/18) ([dependabot[bot]](https://github.com/apps/dependabot))
- \[Build\] Remove automated release steps [\#16](https://github.com/cucumber/cucumber-jvm-groovy/pull/16) ([mpkorstanje](https://github.com/mpkorstanje))

### Fixed

- Issue with compiled groovy step definitions [\#17](https://github.com/cucumber/cucumber-jvm-groovy/issues/17) ([glib-briia](https://github.com/glib-briia))


## [4.7.1] (2019-08-01)

### Changed

- [Core] Migrate to `cucumber-core` 4.7.1 ([glib-briia](https://github.com/glib-briia))

## [4.7.0] (2019-08-01)

### Changed

- [Core] Migrate to `cucumber-core` 4.7.0 ([glib-briia](https://github.com/glib-briia))

## [4.6.0] (2019-07-31)

### Changed

- [Core] Migrate to `cucumber-core` 4.6.0 ([glib-briia](https://github.com/glib-briia))

## [4.5.4] (2019-07-31)

### Changed

- [Core] Migrate to `cucumber-core` 4.5.4 ([glib-briia](https://github.com/glib-briia))

## [4.5.3] (2019-07-09)

### Changed

- [Core] Migrate to `cucumber-core` 4.5.3 ([glib-briia](https://github.com/glib-briia))

## [4.4.0] (2019-06-18)

### Fixed

- Parametrized types as step parameters wont work [\#14](https://github.com/cucumber/cucumber-jvm-groovy/issues/14) ([glib-briia](https://github.com/glib-briia))

## [4.3.1] (2019-05-15)

### Fixed

- datatable is not working in groovy script [\#12](https://github.com/cucumber/cucumber-jvm-groovy/issues/12) ([glib-briia](https://github.com/glib-briia))

## [4.3.0] (2019-04-15)

### Changed

- [Core] Migrate to `cucumber-core` 4.3.0 ([glib-briia](https://github.com/glib-briia))

## [4.2.6] (2019-03-12)

### Fixed

- Classname glue causes crash [\#9](https://github.com/cucumber/cucumber-jvm-groovy/issues/9) ([glib-briia](https://github.com/glib-briia))

### Changed

- Upgrade jackson version [\#13](https://github.com/cucumber/cucumber-jvm-groovy/pull/13) ([mlvandijk](https://github.com/mlvandijk))
- Replace date with local date [\#11](https://github.com/cucumber/cucumber-jvm-groovy/pull/11) ([mpkorstanje](https://github.com/mpkorstanje))

## [4.2.0] (2018-10-29)

### Changed

- [Core] Migrate to `cucumber-core` 4.2.0 ([glib-briia](https://github.com/glib-briia))

## [4.1.0] (2018-10-29)

### Changed

- [Core] Migrate to `cucumber-core` 4.1.0 ([glib-briia](https://github.com/glib-briia))

## [4.0.1] (2018-10-20)

### Added

- GroovyBackend needs constructor taking GroovyShell and TypeRegistry [\#8](https://github.com/cucumber/cucumber-jvm-groovy/issues/8) ([glib-briia](https://github.com/glib-briia))

## [4.0.0] (2018-09-24)

### Changed

- [Core] Migrate to `cucumber-core` 4.0.0 ([glib-briia](https://github.com/glib-briia))

## [3.0.2] (2018-09-22)

### Changed

- [Core] Migrate to `cucumber-core` 3.0.2 ([glib-briia](https://github.com/glib-briia))

### Added

- Add Gradle dependency to README.md [\#5](https://github.com/cucumber/cucumber-jvm-groovy/issues/5) ([glib-briia](https://github.com/glib-briia))

### Fixed

- Licensing [\#4](https://github.com/cucumber/cucumber-jvm-groovy/issues/4) ([glib-briia](https://github.com/glib-briia))
- Command line in Readme.md should work [\#3](https://github.com/cucumber/cucumber-jvm-groovy/issues/3) ([glib-briia](https://github.com/glib-briia))

### Changed

- Update README with gradle dependency. Closes \#5 [\#7](https://github.com/cucumber/cucumber-jvm-groovy/pull/7) ([glib-briia](https://github.com/glib-briia))
- Migrate to cucumber jvm 3.0.2 [\#6](https://github.com/cucumber/cucumber-jvm-groovy/pull/6) ([glib-briia](https://github.com/glib-briia))

<!-- Releases -->
[Unreleased]: https://github.com/cucumber/cucumber-jvm-scala/compare/v6.10.4...main
[5.7.1]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v6.1.2...v6.10.4
[5.7.1]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v6.1.1...v6.1.2
[5.7.1]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v5.1.3...v6.1.1
[5.7.1]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.7.1...v5.1.3
[5.7.1]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.7.0...v4.7.1
[5.7.0]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.6.0...v4.7.0
[4.6.0]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.5.4...v4.6.0
[4.5.4]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.5.3...v4.5.4
[4.5.3]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.4.0...v4.5.3
[4.4.0]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.3.1...v4.4.0
[4.3.1]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.3.0...v4.3.1
[4.3.0]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.2.6...v4.3.0
[4.2.6]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.2.0...cucumber-jvm-groovy-4.2.6
[4.2.0]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.1.0...v4.2.0
[4.1.0]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.0.1...v4.1.0
[4.0.1]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v4.0.0...v4.0.1
[4.0.0]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/v3.0.2...v4.0.0
[3.0.2]:  https://github.com/cucumber/cucumber-jvm-groovy/compare/401f47da936b6e15251b9844717b8ac961d29166...v3.0.2
