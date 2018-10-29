package cucumber.runtime.groovy

import java.text.DateFormat

import static groovy.util.GroovyTestCase.assertEquals
import static java.text.DateFormat.MEDIUM
import static java.util.Locale.ENGLISH

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

class DateWrapper {
  def date
}

Given('today\'s date is "{date}" and tomorrow is:') { DateWrapper today, String tomorrow ->
    assertEquals(3, today.date.date)
    assertEquals('1971-10-04',tomorrow)
}

And('anonymous date is {}') { Date parsedDate ->
    assertEquals(DateFormat.getDateInstance(MEDIUM, ENGLISH).parse("Jan 19, 2011"), parsedDate)
}
