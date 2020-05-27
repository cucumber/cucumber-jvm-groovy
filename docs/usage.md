# Basic Usage

## Glue code

To use Cucumber Groovy, all your glue code (steps or hooks) has to be defined in groovy scripts importing necessary cucumber DSL.

For instance, to use the English flavour:

```groovy
import io.cucumber.groovy.EN
this.metaClass.mixin(Hooks)
this.metaClass.mixin(EN)


Before() {
  // Do something before each scenario
}


Given(~/'^I have (\d+) cucumbers in my belly$'/){ int cucumberCount ->
  // Do something    
}
```

Cucumber will automatically load all the glue code defined in scripts available in the "glue path" (more details in the Run documentation).


## Running Cucumber tests

See also the Running Cucumber for Java [documentation](https://docs.cucumber.io/docs/cucumber/api/#running-cucumber).

Add the `cucumber-junit` dependency to your project.

Then create a runner class like this:
```java
import io.cucumber.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
public class RunCukesTest {
}

```

You can define several options like:
- the "glue path" (default to current package): packages in which to look for glue code
- the "features path" (default to current folder): folder in which to look for features file
