# Step definitions

Step definitions (`Given`, `When`, `Then`) are the glue between features written in Gherkin and the actual tests implementation.

Cucumber supports two types of expressions:

- Cucumber expressions
- Regular expressions

See also the [reference documentation](https://docs.cucumber.io/docs/cucumber/step-definitions/#expressions).

## Cucumber expressions

[Cucumber expressions](https://docs.cucumber.io/docs/cucumber/cucumber-expressions/)

The following Gherkin step:
```gherkin
Given I have 42 cucumbers in my belly
```

Can be implemented with following Cucumber Expression in Groovy:
```groovy
Given("I have {int} cucumbers in my belly"){ int cucumberCount ->
  // Do something    
}
```

## Regular expressions

The following Gherkin step:
```gherkin
Given I have 42 cucumbers in my belly
```

Can be implemented with following Regular Expression in Groovy:
```groovy
Given(~/'^I have (\d+) cucumbers in my belly$'/){ int cucumberCount ->
  // Do something    
}
```

To implement multiple gherkin steps in a single cucumber step:
```groovy
Given([~/^I have (\d+) cuke in my belly/, ~/^I have (\d+) cukes in my belly/] as Pattern[]) { int cukes ->
  // Do something 
}
```