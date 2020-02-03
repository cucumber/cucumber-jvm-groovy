package io.cucumber.groovy;

import groovy.lang.GroovyShell;
import groovy.lang.Script;
import io.cucumber.core.resource.Resource;
import org.codehaus.groovy.runtime.DefaultGroovyMethods;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.util.Optional;

public class GroovyScriptIdentifier {

    private static final String GROOVY_FILE_SUFFIX = ".groovy";

    private GroovyScriptIdentifier() {
    }

    public static URI parse(String groovyIdentifier) {
        return parse(ScriptPath.parse(groovyIdentifier));
    }

    public static URI parse(URI groovyIdentifier) {
        if (!isGroovyScript(groovyIdentifier)) {
            throw new IllegalArgumentException("Groovy identifier does not reference a single groovy file: " + groovyIdentifier);
        } else {
            return groovyIdentifier;
        }
    }

    public static boolean isGroovyScript(URI groovyIdentifier) {
        return groovyIdentifier.getSchemeSpecificPart().endsWith(GROOVY_FILE_SUFFIX);
    }

    public static boolean isGroovyScript(Path path) {
        return path.getFileName().toString().endsWith(GROOVY_FILE_SUFFIX);
    }

    public static StackTraceElement currentLocation() {
        Throwable t = new Throwable();
        StackTraceElement[] stackTraceElements = t.getStackTrace();
        for (StackTraceElement stackTraceElement : stackTraceElements) {
            if (isGroovyFile(stackTraceElement.getFileName())) {
                return stackTraceElement;
            }
        }
        throw new RuntimeException("Couldn't find location for step definition");
    }

    public static boolean isGroovyFile(String fileName) {
        return fileName != null && fileName.endsWith(".groovy");
    }

    public static boolean isScript(Script script) {
        return DefaultGroovyMethods.asBoolean(script.getMetaClass().respondsTo(script, "main"));
    }

    public static Optional<Script> parse(Resource resource, GroovyShell shell) {
        try {
            return Optional.of(shell.parse(new InputStreamReader(resource.getInputStream(), StandardCharsets.UTF_8)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

}
