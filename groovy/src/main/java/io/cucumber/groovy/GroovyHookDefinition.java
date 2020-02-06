package io.cucumber.groovy;


import groovy.lang.Closure;
import io.cucumber.core.backend.HookDefinition;
import io.cucumber.core.backend.TestCaseState;

import static java.util.Objects.requireNonNull;

public class GroovyHookDefinition extends AbstractStepGlueDefinition implements HookDefinition {
    private final String tagExpression;
    private final int order;
    private final GroovyBackend backend;

    public GroovyHookDefinition(
            String tagExpression,
            int order,
            Closure body,
            StackTraceElement location,
            GroovyBackend backend) {
        super(body,location);
        this.tagExpression = requireNonNull(tagExpression, "tag-expression may not be null");;
        this.order = order;
        this.backend = backend;
    }

    @Override
    public void execute(TestCaseState state) {
        Object[] args;
        if (getParameterInfos().size() == 1) {
            args = new Object[]{new io.cucumber.groovy.Scenario(state)};
        } else {
            args = new Object[0];
        }

        Invoker.invoke(backend, body, args);
    }

    @Override
    public String getTagExpression() {
        return tagExpression;
    }

    @Override
    public int getOrder() {
        return order;
    }

}

