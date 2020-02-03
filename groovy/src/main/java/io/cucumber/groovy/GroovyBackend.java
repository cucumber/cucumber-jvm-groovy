package io.cucumber.groovy;


import groovy.lang.Binding;
import groovy.lang.Closure;
import groovy.lang.GroovyShell;
import groovy.lang.Script;
import io.cucumber.core.backend.*;
import io.cucumber.core.exception.CucumberException;
import io.cucumber.core.resource.ClasspathScanner;
import io.cucumber.core.resource.ClasspathSupport;
import io.cucumber.core.resource.ResourceScanner;
import org.codehaus.groovy.control.CompilerConfiguration;

import java.net.URI;
import java.util.*;
import java.util.function.Supplier;

import static io.cucumber.core.resource.ClasspathSupport.CLASSPATH_SCHEME;
import static io.cucumber.groovy.GroovyScriptIdentifier.currentLocation;
import static io.cucumber.groovy.GroovyScriptIdentifier.parse;


public class GroovyBackend implements Backend {
    public static ThreadLocal<GroovyBackend> instanceThreadLocal = new ThreadLocal<>();
    private final Set<Class> scripts = new HashSet<>();
    private final ResourceScanner<Script> resourceLoader;
    private final GroovyShell shell;
    private final ClasspathScanner classFinder;
    private Collection<Closure> worldClosures = new LinkedList<>();
    private GroovyWorld world;
    private Glue glue;

    public GroovyBackend(Lookup lookup, Container container, Supplier<ClassLoader> classLoaderSupplier) {
        this(createShell(), classLoaderSupplier);
    }

    public GroovyBackend(GroovyShell shell, Supplier<ClassLoader> classLoaderSupplier) {
        this.shell = shell;
        this.resourceLoader = new ResourceScanner<>(
                classLoaderSupplier,
                GroovyScriptIdentifier::isGroovyScript,
                resource -> parse(resource, shell)
        );
        this.classFinder = new ClasspathScanner(classLoaderSupplier);
        instanceThreadLocal.set(this);
    }

    public static GroovyBackend getInstance() {
        return instanceThreadLocal.get();
    }

    private static GroovyShell createShell() {
        CompilerConfiguration compilerConfig = new CompilerConfiguration();
        return new GroovyShell(Thread.currentThread().getContextClassLoader(), new Binding(), compilerConfig);
    }


    @Override
    public void loadGlue(Glue glue, List<URI> gluePaths) {
        this.glue = glue;
        final Binding context = shell.getContext();

        //Load sources
        gluePaths.stream().map(resourceLoader::scanForResourcesUri).flatMap(Collection::stream).forEach(script -> runIfScript(context, script));

        //Load compiled scripts
        gluePaths.stream()
                .filter(gluePath -> CLASSPATH_SCHEME.equals(gluePath.getScheme()))
                .map(ClasspathSupport::packageName)
                .map(c -> classFinder.scanForSubClassesInPackage(c, Script.class))
                .flatMap(Collection::stream)
                .forEach(glueClass -> {
                    Script script = null;
                    try {
                        script = glueClass.getConstructor(Binding.class).newInstance(context);
                    } catch (Exception e) {
                        throw new CucumberException(e);
                    }
                    runIfScript(context, script);
                });
    }

    private void runIfScript(Binding context, Script script) {
        Class scriptClass = script.getMetaClass().getTheClass();
        if (GroovyScriptIdentifier.isScript(script) && !scripts.contains(scriptClass)) {
            script.setBinding(context);
            script.run();
            scripts.add(scriptClass);
        }
    }

    @Override
    public void buildWorld() {
        world = new GroovyWorld();
        for (Closure closure : worldClosures) {
            world.registerWorld(closure.call());
        }
    }

    @Override
    public void disposeWorld() {
        this.world = null;
    }

    @Override
    public Snippet getSnippet() {
        return new GroovySnippet();
    }

    public void registerWorld(Closure closure) {
        worldClosures.add(closure);
    }

    public void addStepDefinition(String regexp, Closure body) {
        glue.addStepDefinition(new GroovyStepDefinition(regexp, body, currentLocation(), this));
    }

    public void addBeforeHook(String tagPredicate, int order, Closure body) {
        glue.addBeforeHook(new GroovyHookDefinition(tagPredicate, order, body, currentLocation(), this));
    }

    public void addAfterHook(String tagPredicate, int order, Closure body) {
        glue.addAfterHook(new GroovyHookDefinition(tagPredicate, order, body, currentLocation(), this));
    }

    public void addBeforeStepHook(String tagPredicate, int order, Closure body) {
        glue.addBeforeStepHook(new GroovyHookDefinition(tagPredicate, order, body, currentLocation(), this));
    }

    public void addAfterStepHook(String tagPredicate, int order, Closure body) {
        glue.addAfterStepHook(new GroovyHookDefinition(tagPredicate, order, body, currentLocation(), this));
    }

    GroovyWorld getGroovyWorld() {
        return world;
    }
}
