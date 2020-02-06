package io.cucumber.groovy;

import groovy.lang.Closure;
import io.cucumber.core.backend.Located;
import io.cucumber.core.backend.ParameterInfo;

import java.util.List;

abstract class AbstractStepGlueDefinition implements Located {

    private final StackTraceElement location;
    protected final Closure body;

    AbstractStepGlueDefinition(Closure body, StackTraceElement location) {
        this.location = location;
        this.body = body;
    }

    @Override
    public String getLocation() {
        return location.getFileName() + ":" + location.getLineNumber();
    }

    @Override
    public boolean isDefinedAt(StackTraceElement stackTraceElement) {
        return location.getFileName().equals(stackTraceElement.getFileName());
    }

    List<ParameterInfo> getParameterInfos() {
        Class[] parameterTypes = body.getParameterTypes();
        return ParameterInfoGroovy.fromTypes(parameterTypes);
    }

}