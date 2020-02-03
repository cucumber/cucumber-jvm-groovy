package io.cucumber.groovy;

import groovy.lang.Closure;
import io.cucumber.core.backend.CucumberBackendException;
import io.cucumber.core.backend.CucumberInvocationTargetException;
import io.cucumber.core.backend.ParameterInfo;
import io.cucumber.core.backend.StepDefinition;

import java.util.List;

import static java.util.Objects.requireNonNull;

public class GroovyStepDefinition implements StepDefinition {
    private final String pattern;

    private final Closure body;
    private final StackTraceElement location;
    private final GroovyBackend backend;


    private final List<ParameterInfo> parameterInfos;

    public GroovyStepDefinition(String pattern, Closure body, StackTraceElement location, GroovyBackend backend) {
        this.pattern = requireNonNull(pattern, "cucumber-expression may not be null");
        this.backend = backend;
        this.body = body;
        this.location = location;
        this.parameterInfos = getParameterInfos();
    }

    @Override
    public String getLocation() {
        return location.getFileName() + ":" + location.getLineNumber();
    }

    private List<ParameterInfo> getParameterInfos() {
        Class[] parameterTypes = body.getParameterTypes();
        return ParameterInfoGroovy.fromTypes(parameterTypes);
    }

    @Override
    public void execute(final Object[] args) throws CucumberBackendException, CucumberInvocationTargetException {
        Invoker.invoke(backend, body, args);
    }

    @Override
    public List<ParameterInfo> parameterInfos() {
        return parameterInfos;
    }

    public boolean isDefinedAt(StackTraceElement stackTraceElement) {
        return location.getFileName().equals(stackTraceElement.getFileName());
    }

    @Override
    public String getPattern() {
        return pattern;
    }
}
