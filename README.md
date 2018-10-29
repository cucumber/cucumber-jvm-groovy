## Maven Dependency

[![Build Status](https://travis-ci.org/cucumber/cucumber-jvm-groovy.svg?branch=master)](https://travis-ci.org/cucumber/cucumber-jvm-groovy)
[![Maven Central](https://maven-badges.herokuapp.com/maven-central/io.cucumber/cucumber-groovy/badge.svg)](https://maven-badges.herokuapp.com/maven-central/io.cucumber/cucumber-groovy) 

To use cucumber-jvm-groovy in your project, add the following dependency:

- If using maven add to your `pom.xml`:

```xml
<dependency>
    <groupId>io.cucumber</groupId>
    <artifactId>cucumber-groovy</artifactId>
    <version>4.1.0</version>
    <scope>test</scope>
</dependency>
```

- If using garadle add to your `build.gradle`:
```
testCompile group: 'io.cucumber', name:'cucumber-groovy', version: '4.0.0'
```

## Running from the Command Line Interface (CLI)

To run the test from the cli call:

    groovy -cp "target/test-classes;./bin/cucumber-groovy-shaded.jar" ./bin/cucumber-jvm.groovy --glue classpath:cucumber/runtime/groovy src/test/resources/cucumber/runtime/groovy/a_feature.feature

or

    groovy -cp "target/test-classes;./bin/cucumber-groovy-shaded.jar" ./bin/cucumber-jvm.groovy --glue classpath:cucumber.runtime.groovy --glue src/test/resources src/test/resources/cucumber/runtime/groovy/a_feature.feature
    
The test uses a mix of compiled and interpreted step definitions which makes the command a bit tricky:

1. `-cp target/test-classes;./bin/cucumber-groovy-shaded.jar` tells groovy where to find the compiled class files and needed dependencies for `TypeRegistryConfigurer` descendants.
2. `--glue classpath:cucumber/runtime/groovy` or `--glue classpath:cucumber.runtime.groovy --glue src/test/resources` is required so that cucumber finds the compiled step definitions
3. the last parameter provides a feature or a path with features

This demonstrates that the files in the `bin` directory (`cucumber-jvm.groovy`, `cucumber-groovy.jar` and `cucumber-core.jar` 
are a completely standalone execution environment. 

TODO: Figure out the best way to package and publish this as a "groovy package". Maybe just a zip file?
