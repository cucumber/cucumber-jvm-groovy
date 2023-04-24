package io.cucumber.groovy;

import groovy.lang.Closure;
import org.codehaus.groovy.runtime.MethodClosure;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.fail;

@ExtendWith(MockitoExtension.class)
@ExtendWith(MockitoExtension.class)
public class GroovyStackTraceTest {
    GroovyStepDefinition groovyStepDefinition;

    @BeforeEach
    public void setUp() {
        Closure<?> body = new MethodClosure("the owner", "length");
        groovyStepDefinition = new GroovyStepDefinition("", body, null, new ExceptionThrowingBackend());
    }

    @Test
    public void should_sanitize_stacktrace() {
        try {
            groovyStepDefinition.execute(new Object[0]);
            fail("step definition didn't throw an exception");
        } catch (Throwable thrown) {
            for (StackTraceElement stackTraceElement : thrown.getStackTrace()) {
                // if there are none of these, pretty good chance it's cleaned
                // up the stack trace
                assertFalse(stackTraceElement.getClassName().startsWith("org.codehaus.groovy.runtime.callsite"),
                    "Stack trace has internal groovy callsite elements");
            }
        }

    }

    private static class ExceptionThrowingBackend extends GroovyBackend {

        public ExceptionThrowingBackend() {
            super(null, null, null);
        }

    }
}
