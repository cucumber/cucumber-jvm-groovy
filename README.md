## Maven Dependency

[![Maven Central](https://img.shields.io/maven-central/v/io.cucumber/cucumber-groovy.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22io.cucumber%22%20AND%20a:%22cucumber-groovy%22)
[![Build Status](https://travis-ci.org/cucumber/cucumber-jvm-groovy.svg?branch=master)](https://travis-ci.org/cucumber/cucumber-jvm-groovy)


To use cucumber-jvm-groovy in your project, add the following dependency:

- If using maven add to your `pom.xml`:

```xml
<dependency>
    <groupId>io.cucumber</groupId>
    <artifactId>cucumber-groovy</artifactId>
    <version>4.7.1</version>
    <scope>test</scope>
</dependency>
```

- If using gradle add to your `build.gradle`:
```
testCompile group: 'io.cucumber', name:'cucumber-groovy', version: '4.7.1'
```

## Running from the Command Line Interface (CLI)

To run the test from the cli call:

    groovy -cp "target/test-classes;./bin/cucumber-groovy-shaded.jar" ./bin/cucumber-jvm.groovy --glue classpath:cucumber/runtime/groovy src/test/resources/cucumber/runtime/groovy/a_feature.feature

or

    groovy -cp "target/test-classes;./bin/cucumber-groovy-shaded.jar" ./bin/cucumber-jvm.groovy --glue classpath:cucumber.runtime.groovy --glue src/test/resources src/test/resources/cucumber/runtime/groovy/a_feature.feature
    
The test uses a mix of compiled and interpreted step definitions which makes the command a bit tricky:

1. `-cp target/test-classes;./bin/cucumber-groovy-shaded.jar` tells groovy where to find the compiled class files and needed dependencies for `TypeRegistryConfigurer` descendants.
2. `--glue classpath:cucumber/runtime/groovy` or `--glue classpath:cucumber.runtime.groovy --glue src/test/resources` is required so that cucumber finds the compiled step definitions
3. The last parameter provides a feature or a path with features

## Getting started

- [Installation](./docs/install.md)
- Upgrade notes
  - [Version 5.x](docs/upgrade_v5.md)
- Documentation
  - [Basic usage](docs/usage.md)
  - [Step Definitions](docs/step_definitions.md)
    - [DataTables](docs/datatables.md)
  - [Hooks](docs/hooks.md)
  - [Transformers](docs/transformers.md)
    - [Default Jackson DataTable Transformer](docs/default_jackson_datatable_transformer.md)
- [Example project](examples/README.md)
- [Reference documentation for Java](https://docs.cucumber.io/docs/cucumber/)
- [Changelog](CHANGELOG.md)

