package io.cucumber.groovy;


import groovy.lang.Closure;
import io.cucumber.core.exception.CucumberException;
import org.apiguardian.api.API;

@API(status = API.Status.STABLE)
public class Hooks {
    private static final int DEFAULT_ORDER = 1000;


    public static void World(Closure body) {
        GroovyBackend.getInstance().registerWorld(body);
    }

    /**
     * Registers a before hook, which is executed before specific, or all, scenarios.
     * <p>
     * Following values are expected as hook parameters.
     * - Integer order: the order in which this hook should run. Lower numbers are run first. The default is 10000.
     * - String(s) tags: one or more tag expression to filter the certain scenarios. The default is empty.
     * - Closure body: hook body which is executed before scenario. Not null.
     *
     * @param args the hook parameters
     */
    public static void Before(Object... args) {
        addHook(args, true, false);
    }

    /**
     * Registers an after hook, which is executed after specific, or all, scenarios.
     * <p>
     * Following values are expected as hook parameters.
     * - Integer order: the order in which this hook should run. Higher numbers are run first. The default is 10000.
     * - String(s) tags: one or more tag expression to filter the certain scenarios. The default is empty.
     * - Closure body: hook body which is executed after scenario. Not null.
     *
     * @param args the hook parameters
     */
    public static void After(Object... args) {
        addHook(args, false, false);
    }

    public static void AfterStep(Object... args) {
        addHook(args, false, true);
    }

    public static void BeforeStep(Object... args) {
        addHook(args, true, true);
    }

    private static void addHook(Object[] tagsExpressionsAndBody, boolean before, boolean forStep) {
        int order = DEFAULT_ORDER;
        boolean orderSet = false;
        Closure body = null;
        String tagExpressions = "";

        for (Object o : tagsExpressionsAndBody) {
            if (o instanceof String) {
                tagExpressions = (String) o;
            } else if (o instanceof Integer) {
                if (orderSet) {
                    throw new CucumberException("Two order (Integer) arguments found; " +
                            order + ", and; " +
                            o);
                }
                order = (Integer) o;
                orderSet = true;
            } else if (o instanceof Closure) {
                body = (Closure) o;
            } else {
                throw new CucumberException("An argument of the type " + o.getClass().getName() + " found, " +
                        (before ? "Before" : "After") + " only allows the argument types " +
                        "String - Tag, Integer - order, and Closure");
            }
        }

        if (before) {
            if (forStep) {
                GroovyBackend.getInstance().addBeforeStepHook(tagExpressions, order, body);
            } else {
                GroovyBackend.getInstance().addBeforeHook(tagExpressions, order, body);
            }
        } else {
            if (forStep) {
                GroovyBackend.getInstance().addAfterStepHook(tagExpressions, order, body);
            } else {
                GroovyBackend.getInstance().addAfterHook(tagExpressions, order, body);
            }
        }
    }
}
