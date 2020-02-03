package io.cucumber.groovy

import io.cucumber.groovy.EN

this.metaClass.mixin(Hooks)
this.metaClass.mixin(EN)

Given(~/^I have (\d+) cukes in my belly/) { int cukes ->
    haveCukes(cukes)
    lastAte('cukes')
}
