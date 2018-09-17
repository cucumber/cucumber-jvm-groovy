## Maven Dependency

[![Maven Central](https://maven-badges.herokuapp.com/maven-central/io.cucumber/cucumber-groovy/badge.svg)](https://maven-badges.herokuapp.com/maven-central/io.cucumber/cucumber-groovy)

To use cucumber-jvm-groovy in your project, add the following dependency:

- If using maven add to your `pom.xml`:

```xml
<dependency>
    <groupId>io.cucumber</groupId>
    <artifactId>cucumber-groovy</artifactId>
    <version>2.0.1</version>
    <scope>test</scope>
</dependency>
```

- If using garadle add to your `build.gradle`:
```
testCompile group: 'io.cucumber', name:'cucumber-jvm', version: '3.0.2'
```

## Running from the Command Line Interface (CLI)

To run the test from the cli call:

    groovy -cp target/test-classes ./bin/cucumber-jvm.groovy --glue src/test/resources --glue cucumber/runtime/groovy src/test/resources/cucumber/runtime/groovy/a_feature.feature

or

    groovy -cp target/test-classes ./bin/cucumber-jvm.groovy --glue src/test/resources --glue cucumber.runtime.groovy src/test/resources/cucumber/runtime/groovy/a_feature.


The test uses a mix of compiled and interpreted step definitions which makes the command a bit tricky:

1. `-cp target/test-classes` tells groovy where to find the compiled class files
2. `--glue src/test/resources` is required so that cucumber finds the interpreted step definitions
3. `--glue cucumber/runtime/groovy` or `--glue cucumber.runtime.groovy` is required so that cucumber finds the compiled step definitions
4. the last parameter provides a feature or a path with features

This demonstrates that the files in the `bin` directory (`cucumber-jvm.groovy`, `cucumber-groovy.jar` and `cucumber-core.jar` 
are a completely standalone execution environment. 

TODO: Figure out the best way to package and publish this as a "groovy package". Maybe just a zip file?
