package io.cucumber.groovy;

import io.cucumber.core.backend.ParameterInfo;
import io.cucumber.core.backend.TypeResolver;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class ParameterInfoGroovy implements ParameterInfo {
    private final Type type;
    private final boolean transposed;

    public ParameterInfoGroovy(Type type, boolean transposed) {
        this.type = type;
        this.transposed = transposed;
    }

    public static List<ParameterInfo> fromTypes(Type[] genericParameterTypes) {
        List<ParameterInfo> result = new ArrayList();
        for (int i = 0; i < genericParameterTypes.length; ++i) {
            boolean transposed = false;
            result.add(new ParameterInfoGroovy(genericParameterTypes[i], transposed));
        }
        return result;
    }

    public Type getType() {
        return this.type;
    }

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

