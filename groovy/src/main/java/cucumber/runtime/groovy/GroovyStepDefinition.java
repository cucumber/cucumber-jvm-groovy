package cucumber.runtime.groovy;

import cucumber.runtime.StepDefinition;
import cucumber.runtime.Timeout;
import gherkin.pickles.PickleStep;
import groovy.lang.Closure;
import io.cucumber.stepexpression.*;
import org.codehaus.groovy.runtime.StackTraceUtils;

import java.lang.reflect.Type;
import java.util.List;

public class GroovyStepDefinition implements StepDefinition {
    private final String pattern;
    private final long timeoutMillis;
    private final Closure body;
    private final StackTraceElement location;
    private final GroovyBackend backend;
    private final StepExpression expression;
    private final List<ParameterInfo> parameterInfos;

    public GroovyStepDefinition(String pattern, long timeoutMillis, Closure body, StackTraceElement location, GroovyBackend backend, TypeRegistry typeRegistry) {
        this.pattern = pattern;
        this.timeoutMillis = timeoutMillis;
        this.backend = backend;
        this.body = body;
        this.location = location;
        this.parameterInfos = getParameterInfos();
        this.expression = createExpression(pattern, typeRegistry);
    }

    private StepExpression createExpression(String expression, TypeRegistry typeRegistry) {
        if (parameterInfos.isEmpty()) {
            return new StepExpressionFactory(typeRegistry).createExpression(expression);
        } else {
            ParameterInfo parameterInfo = parameterInfos.get(parameterInfos.size() - 1);
            return new StepExpressionFactory(typeRegistry).createExpression(expression, parameterInfo.getType(), parameterInfo.isTransposed());
        }
    }

    @Override
    public List<Argument> matchedArguments(PickleStep step) {
        ArgumentMatcher argumentMatcher = new ExpressionArgumentMatcher(expression);
        Type[] types = new Type[parameterInfos.size()];
        for (int i = 0; i < types.length; i++) {
            types[i] = parameterInfos.get(i).getType();
        }
        return argumentMatcher.argumentsFrom(step, types);
    }

    public String getLocation(boolean detail) {
        return location.getFileName() + ":" + location.getLineNumber();
    }

    @Override
    public Integer getParameterCount() {
        return parameterInfos.size();
    }

    private List<ParameterInfo> getParameterInfos() {
        Class[] parameterTypes = body.getParameterTypes();
        return ParameterInfo.fromTypes(parameterTypes);
    }

    @Override
    public void execute(final Object[] args) throws Throwable {
        try {
            Timeout.timeout(() -> {
                backend.invoke(body, args);
                return null;
            }, timeoutMillis);
        } catch (Throwable e) {
            throw StackTraceUtils.deepSanitize(e);
        }
    }

    public boolean isDefinedAt(StackTraceElement stackTraceElement) {
        return location.getFileName().equals(stackTraceElement.getFileName());
    }

    @Override
    public String getPattern() {
        return expression.getSource();
    }

    @Override
    public boolean isScenarioScoped() {
        return false;
    }
}
