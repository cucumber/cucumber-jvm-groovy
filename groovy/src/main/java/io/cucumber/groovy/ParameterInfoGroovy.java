package io.cucumber.groovy;

import groovy.lang.Closure;
import io.cucumber.core.backend.ParameterInfo;
import io.cucumber.core.backend.TypeResolver;

import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ParameterInfoGroovy implements ParameterInfo {
    private final Type type;
    private final boolean transposed;

    public ParameterInfoGroovy(Type type, boolean transposed) {
        this.type = type;
        this.transposed = transposed;
    }

    public static List<ParameterInfo> fromTypes(Closure closure) {
        List<ParameterInfo> result = new ArrayList<>();
        Type[] genericParameterTypes = Arrays.stream(closure.getClass().getMethods())
                .filter(it -> it.getName().equals("call")).findFirst().get().getGenericParameterTypes();
        if (closure.getParameterTypes().length < genericParameterTypes.length) {
            genericParameterTypes = closure.getParameterTypes();
        }
        Annotation[][] annotations = Arrays.stream(closure.getClass().getMethods())
                .filter(it -> it.getName().equals("call")).findFirst().get().getParameterAnnotations();
        for (int i = 0; i < genericParameterTypes.length; i++) {
            boolean transposed = false;
            for (Annotation annotation : annotations[i]) {
                if (annotation instanceof Transpose) {
                    transposed = ((Transpose) annotation).value();
                }
            }
            result.add(new ParameterInfoGroovy(genericParameterTypes[i], transposed));
        }
        return result;
    }

    public static List<ParameterInfo> fromTypesHooks(Closure closure) {
        List<ParameterInfo> result = new ArrayList<>();
        Type[] parameterTypes = closure.getParameterTypes();
        for (int i = 0; i < parameterTypes.length; i++) {
            result.add(new ParameterInfoGroovy(parameterTypes[i], false));
        }
        return result;
    }

    @Override
    public Type getType() {
        return this.type;
    }

    @Override
    public boolean isTransposed() {
        return this.transposed;
    }

    @Override
    public TypeResolver getTypeResolver() {
        return () -> type;
    }

    public String toString() {
        return this.type.toString();
    }

}
