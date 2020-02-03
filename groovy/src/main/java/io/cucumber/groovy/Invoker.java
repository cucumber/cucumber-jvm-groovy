package io.cucumber.groovy;

import groovy.lang.Closure;
import io.cucumber.core.backend.CucumberBackendException;
import org.codehaus.groovy.runtime.InvokerInvocationException;

public class Invoker {

    static void invoke(GroovyBackend backend, Closure body, Object[] args) throws CucumberBackendException {
        body.setResolveStrategy(Closure.DELEGATE_FIRST);
        body.setDelegate(backend.getGroovyWorld());
        try {
            body.call(args);
        } catch (InvokerInvocationException e) {
            throw new CucumberBackendException("Failed to invoke step", e);
        }
    }
}
