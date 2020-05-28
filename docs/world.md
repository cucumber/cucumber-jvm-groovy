# World

World is an isolated context for each scenario that allow to share state between cucumber steps.

See the [reference documentation](https://cucumber.io/docs/cucumber/state/).

In groovy `World` can be defined in any step definition script as follows:

```groovy
World {
    new CustomWorld()
}
```

And the `World` object itself making its properties and methods available in step definitions:

```groovy
class CustomWorld {
    def lastAte

    def lastAte(food) {
        lastAte = food
    }

    def getMood() {
        'cukes'.equals(lastAte) ? 'happy' : 'tired'
    }
}
```

Fo example in the below gherkin where we need to pass `what` value from the datatable from one step to another

```gherkin
  Scenario Outline: Passing varibales between steps
    Given I have <n> <what> in my belly
    Then I should be <mood>

  Examples: some cukes
    | n  | what   | mood  |
    | 13 | cukes  | happy |
    | 4  | apples | tired |
```

In step definitions we can save the value in `CustomWorld` object calling `lastAte('cukes')`

```groovy
Given([~/^I have (\d+) cuke in my belly/, ~/^I have (\d+) cukes in my belly/] as Pattern[]) { int cukes ->
    lastAte('cukes')
}
```

And check the saved value in subsequent step as follows:

```groovy
Then(~'^I should be (.*)') { String mood ->
    assertEquals(mood, getMood())
}
```
