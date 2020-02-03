package io.cucumber.groovy

import io.cucumber.groovy.EN

import java.time.LocalDate

import static groovy.util.GroovyTestCase.assertEquals

this.metaClass.mixin(Hooks)
this.metaClass.mixin(EN)

class DateWrapper {
  def date
}

Given('today\'s date is "{date}" and tomorrow is:') { DateWrapper today, String tomorrow ->
    assertEquals(3, today.date.getDayOfMonth())
    assertEquals('1971-10-04',tomorrow)
}

And('anonymous date is {}') { LocalDate parsedDate ->
    assertEquals(LocalDate.of(2011, 1, 19), parsedDate)
}
