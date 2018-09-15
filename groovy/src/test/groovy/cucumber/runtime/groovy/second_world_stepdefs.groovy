package cucumber.runtime.groovy

import io.cucumber.datatable.DataTable

import javax.xml.crypto.Data

this.metaClass.mixin(cucumber.api.groovy.EN)
this.metaClass.mixin(cucumber.api.groovy.Hooks)

def topLevelValueWrite = 100
def topLevelValueRead = "TOP"


World {
    new AnotherCustomWorld()
}

When(~/^set world property "(\w+)"$/) { p ->
    aProperty = p
    topLevelValueWrite = p
}

Then(~/^properties visibility is ok$/) { ->
    assert topLevelValueWrite && topLevelValueWrite != 100
    assert topLevelValueRead == "TOP"
}

Then(~/^world property is "(\w+)"$/) { p ->
    assert aProperty == p
    assert propertyValue == p
    assert topLevelValueWrite == p
}

When(~/^world method call$/) {  ->
    aMethod()
}

When(~/^world method call:$/) { DataTable table ->
    aMethod(table.asList(Integer))
}

Then(~/^world method call is:$/) { DataTable table ->
    methodArgs == table.asList(Integer)
}



