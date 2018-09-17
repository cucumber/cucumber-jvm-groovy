package cucumber.runtime.groovy;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class ParameterInfo {
    private final Type type;
    private final boolean transposed;


    public ParameterInfo(Type type, boolean transposed) {
        this.type = type;
        this.transposed = transposed;
    }

    public static List<ParameterInfo> fromTypes(Type[] genericParameterTypes) {
        List<ParameterInfo> result = new ArrayList();
        for (int i = 0; i < genericParameterTypes.length; ++i) {
            boolean transposed = false;
            result.add(new ParameterInfo(genericParameterTypes[i], transposed));
        }
        return result;
    }

    public Type getType() {
        return this.type;
    }

    public boolean isTransposed() {
        return this.transposed;
    }

    public String toString() {
        return this.type.toString();
    }

}

