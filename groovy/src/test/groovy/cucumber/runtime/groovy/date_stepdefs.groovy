package cucumber.runtime.groovy

import static groovy.util.GroovyTestCase.assertEquals

import java.text.SimpleDateFormat

this.metaClass.mixin(cucumber.api.groovy.Hooks)
this.metaClass.mixin(cucumber.api.groovy.EN)

class DateWrapper {
  def date
}

Given('today\'s date is "{date}" and tomorrow is:') { DateWrapper today, String tomorrow ->
    assertEquals(3, today.date.date)
    assertEquals('1971-10-04',tomorrow)
}
