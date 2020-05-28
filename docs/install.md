# Installation

## Dependency

### Gradle

To use Cucumber Groovy in your project, add the following line to your `build.gradle`:

```
testCompile group: 'io.cucumber', name:'cucumber-groovy', version: '5.1.3'
```

### Maven

To use Cucumber Groovy in your project, add the following dependency to your `pom.xml`:

```xml
<dependency>
    <groupId>io.cucumber</groupId>
    <artifactId>cucumber-groovy</artifactId>
    <version>5.1.3</version>
    <scope>test</scope>
</dependency>
```

### Running from the Command Line Interface (CLI)

To run the test from the cli call:

    groovy -cp "target/test-classes;./bin/cucumber-groovy-shaded.jar" ./bin/cucumber-jvm.groovy --glue classpath:cucumber/runtime/groovy src/test/resources/cucumber/runtime/groovy/a_feature.feature

or

    groovy -cp "target/test-classes;./bin/cucumber-groovy-shaded.jar" ./bin/cucumber-jvm.groovy --glue classpath:cucumber.runtime.groovy --glue src/test/resources src/test/resources/cucumber/runtime/groovy/a_feature.feature
    
The test uses a mix of compiled and interpreted step definitions which makes the command a bit tricky:

1. `-cp target/test-classes;./bin/cucumber-groovy-shaded.jar` tells groovy where to find the compiled class files and needed dependencies for `TypeRegistryConfigurer` descendants.
2. `--glue classpath:cucumber/runtime/groovy` or `--glue classpath:cucumber.runtime.groovy --glue src/test/resources` is required so that cucumber finds the compiled step definitions
3. The last parameter provides a feature or a path with features
