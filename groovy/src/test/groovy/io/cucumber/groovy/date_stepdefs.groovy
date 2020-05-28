package io.cucumber.groovy

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule

import java.lang.reflect.Type
import java.time.LocalDate

import static groovy.util.GroovyTestCase.assertEquals

this.metaClass.mixin(Hooks)
this.metaClass.mixin(EN)

class DateWrapper {
  def date
}


@ParameterType("([0-9]{4})-([0-9]{2})-([0-9]{2})")
LocalDate parameterTypeIso8601Date(String year, String month, String day) {
    LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day))
}

@DefaultParameterTransformer
Object anonymous(String fromValue, Type toValueType) {
    ObjectMapper objectMapper = new ObjectMapper()
    objectMapper.registerModule(new JavaTimeModule())
    objectMapper.convertValue(fromValue, objectMapper.constructType(toValueType));
}


Given('today\'s date is "{parameterTypeIso8601Date}" and tomorrow is:') { LocalDate today, String tomorrow ->
    assertEquals(3, today.getDayOfMonth())
    assertEquals('1971-10-04',tomorrow)
}

And('anonymous date is {}') { LocalDate parsedDate ->
    assertEquals( LocalDate.of(2011, 1, 19), parsedDate)
}
