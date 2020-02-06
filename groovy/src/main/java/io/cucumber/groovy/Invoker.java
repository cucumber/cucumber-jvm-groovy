package io.cucumber.groovy;

import groovy.lang.Closure;
import io.cucumber.core.backend.CucumberBackendException;
import io.cucumber.core.backend.CucumberInvocationTargetException;
import io.cucumber.core.backend.Located;
import org.codehaus.groovy.runtime.InvokerInvocationException;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

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

    static Object invoke(Located located, Object target, Method method, Object... args) {
        Method targetMethod = targetMethod(target, method);
        boolean accessible = targetMethod.isAccessible();
        try {
            targetMethod.setAccessible(true);

            return targetMethod.invoke(target, args);
        } catch (IllegalArgumentException | IllegalAccessException e) {
            throw new CucumberBackendException("Failed to invoke " + targetMethod, e);
        } catch (InvocationTargetException e) {
            if (located == null) { // Reflecting into annotations
                throw new CucumberBackendException("Failed to invoke " + targetMethod, e);
            }
            throw new CucumberInvocationTargetException(located, e);
        } finally {
            targetMethod.setAccessible(accessible);
        }
    }

    private static Method targetMethod(Object target, Method method) {
        Class<?> targetClass = target.getClass();
        Class<?> declaringClass = method.getDeclaringClass();

        // Immediately return the provided method if the class loaders are the same.
        if (targetClass.getClassLoader().equals(declaringClass.getClassLoader())) {
            return method;
        }

        try {
            // Check if the method is publicly accessible. Note that methods from interfaces are always public.
            if (Modifier.isPublic(method.getModifiers())) {
                return targetClass.getMethod(method.getName(), method.getParameterTypes());
            }

            // Loop through all the super classes until the declared method is found.
            Class<?> currentClass = targetClass;
            while (currentClass != Object.class) {
                try {
                    return currentClass.getDeclaredMethod(method.getName(), method.getParameterTypes());
                } catch (NoSuchMethodException e) {
                    currentClass = currentClass.getSuperclass();
                }
            }

            // The method does not exist in the class hierarchy.
            throw new NoSuchMethodException(String.valueOf(method));
        } catch (NoSuchMethodException e) {
            throw new CucumberBackendException("Could not find target method", e);
        }
    }
}
