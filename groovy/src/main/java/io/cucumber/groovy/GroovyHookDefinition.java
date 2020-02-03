package io.cucumber.groovy;


import groovy.lang.Closure;
import io.cucumber.core.backend.HookDefinition;
import io.cucumber.core.backend.TestCaseState;
import org.codehaus.groovy.ant.Groovy;

public class GroovyHookDefinition implements HookDefinition {
    private final String expression;
    private final int order;
    private final Closure body;
    private final GroovyBackend backend;
    private final StackTraceElement location;

    public GroovyHookDefinition(
            String expression,
            int order,
            Closure body,
            StackTraceElement location,
            GroovyBackend backend) {

        this.expression = expression;
        this.order = order;
        this.body = body;
        this.location = location;
        this.backend = backend;
    }

    @Override
    public String getLocation() {
        return location.getFileName() + ":" + location.getLineNumber();
    }

    @Override
    public void execute(TestCaseState scenario) {
        Invoker.invoke(backend, body, new Object[]{scenario});
    }

    @Override
    public String getTagExpression() {
        return expression;
    }

    @Override
    public int getOrder() {
        return order;
    }

    @Override
    public boolean isDefinedAt(StackTraceElement stackTraceElement) {
        return location.getFileName().equals(stackTraceElement.getFileName());
    }


}

