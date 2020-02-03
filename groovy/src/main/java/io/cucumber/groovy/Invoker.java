package io.cucumber.groovy;

import groovy.lang.Closure;
import io.cucumber.core.backend.CucumberBackendException;
import io.cucumber.core.backend.CucumberInvocationTargetException;
import org.codehaus.groovy.runtime.InvokerInvocationException;

import java.lang.reflect.InvocationTargetException;

public class Invoker {

    static void invoke(GroovyBackend backend, Closure body, Object[] args) throws CucumberBackendException {
        body.setResolveStrategy(Closure.DELEGATE_FIRST);
        body.setDelegate(backend.getGroovyWorld());
        try {
            body.call(args);
        } catch (InvokerInvocationException e) {
            throw new CucumberInvocationTargetException(null, new InvocationTargetException(e.getCause()));
        }
    }
}
