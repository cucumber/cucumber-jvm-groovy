package cucumber.runtime.groovy

import java.time.LocalDate

import static groovy.util.GroovyTestCase.assertEquals

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

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
