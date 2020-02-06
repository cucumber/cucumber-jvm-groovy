package io.cucumber.groovy;

import groovy.lang.Closure;
import io.cucumber.core.backend.CucumberBackendException;
import io.cucumber.core.backend.CucumberInvocationTargetException;
import io.cucumber.core.backend.ParameterInfo;
import io.cucumber.core.backend.StepDefinition;

import java.util.List;

import static java.util.Objects.requireNonNull;

public class GroovyStepDefinition extends AbstractStepGlueDefinition implements StepDefinition {
    private final String expression;
    private final Closure body;
    private final GroovyBackend backend;

    public GroovyStepDefinition(String expression, Closure body, StackTraceElement location, GroovyBackend backend) {
        super(body,location);
        this.expression = requireNonNull(expression, "cucumber-expression may not be null");
        this.backend = backend;
        this.body = body;
    }

    @Override
    public void execute(final Object[] args) throws CucumberBackendException, CucumberInvocationTargetException {
        Invoker.invoke(backend, body, args);
    }

    @Override
    public List<ParameterInfo> parameterInfos() {
        return getParameterInfos();
    }

    @Override
    public String getPattern() {
        return expression;
    }
}
