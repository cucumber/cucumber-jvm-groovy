package io.cucumber.groovy

import io.cucumber.groovy.EN

import java.util.regex.Pattern

this.metaClass.mixin(Hooks)
this.metaClass.mixin(EN)

Given([~/^I have (\d+) cuke in my belly/, ~/^I have (\d+) cukes in my belly/] as Pattern[]) { int cukes ->
    haveCukes(cukes)
    lastAte('cukes')
}
