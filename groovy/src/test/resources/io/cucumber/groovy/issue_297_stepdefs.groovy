package io.cucumber.groovy

import io.cucumber.groovy.EN

this.metaClass.mixin(EN)

// Step definitions without parameters must explicitly define an empty list of parameters.
Given(~/Carbon Coder is running correctly$/) { ->
}
