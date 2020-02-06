package io.cucumber.groovy;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.function.BiConsumer;

import static io.cucumber.groovy.InvalidMethodException.createInvalidMethodException;

final class MethodScanner {

    private MethodScanner() {
    }

    static void scan(Class<?> aClass, BiConsumer<Method, Annotation> consumer) {
        // prevent unnecessary checking of Object methods
        if (Object.class.equals(aClass)) {
            return;
        }

        if (!isInstantiable(aClass)) {
            return;
        }
        for (Method method : aClass.getMethods()) {
            scan(consumer, aClass, method);
        }
    }

    private static boolean isInstantiable(Class<?> clazz) {
        boolean isNonStaticInnerClass = !Modifier.isStatic(clazz.getModifiers()) && clazz.getEnclosingClass() != null;
        return Modifier.isPublic(clazz.getModifiers()) && !Modifier.isAbstract(clazz.getModifiers()) && !isNonStaticInnerClass;
    }

    private static void scan(BiConsumer<Method, Annotation> consumer, Class<?> aClass, Method method) {
        //prevent unnecessary checking of Object methods
        if (Object.class.equals(method.getDeclaringClass())) {
            return;
        }
        scan(consumer, aClass, method, method.getAnnotations());
    }

    private static void scan(BiConsumer<Method, Annotation> consumer, Class<?> aClass, Method method, Annotation[] methodAnnotations) {
        for (Annotation annotation : methodAnnotations) {
            if (isTypeAnnotation(annotation)) {
                validateMethod(aClass, method);
                consumer.accept(method, annotation);
            }
        }
    }

    private static void validateMethod(Class<?> glueCodeClass, Method method) {
        if (!glueCodeClass.equals(method.getDeclaringClass())) {
            throw createInvalidMethodException(method, glueCodeClass);
        }
    }

    private static boolean isTypeAnnotation(Annotation annotation) {
        Class<? extends Annotation> annotationClass = annotation.annotationType();
        return  annotationClass.equals(ParameterType.class)
            || annotationClass.equals(DataTableType.class)
            || annotationClass.equals(DefaultParameterTransformer.class)
            || annotationClass.equals(DefaultDataTableEntryTransformer.class)
            || annotationClass.equals(DefaultDataTableCellTransformer.class)
            || annotationClass.equals(DocStringType.class);
    }

}
