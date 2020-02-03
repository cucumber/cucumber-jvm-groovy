package io.cucumber.groovy;

import io.cucumber.core.resource.ClasspathSupport;

import java.io.File;
import java.net.URI;
import java.util.Locale;
import java.util.Objects;

public class ScriptPath {

    private ScriptPath() {
    }

    public static URI parse(String scriptIdentifier) {
        Objects.requireNonNull(scriptIdentifier, "scriptIdentifier may not be null");
        if (scriptIdentifier.isEmpty()) {
            throw new IllegalArgumentException("scriptIdentifier may not be empty");
        } else if ("classpath:".equals(scriptIdentifier)) {
            return ClasspathSupport.rootPackageUri();
        } else if (nonStandardPathSeparatorInUse(scriptIdentifier)) {
            String standardized = replaceNonStandardPathSeparator(scriptIdentifier);
            return parseAssumeFileScheme(standardized);
        } else if (isWindowsOS() && pathContainsWindowsDrivePattern(scriptIdentifier)) {
            return parseAssumeFileScheme(scriptIdentifier);
        } else {
            return probablyURI(scriptIdentifier) ? parseProbableURI(scriptIdentifier) : parseAssumeFileScheme(scriptIdentifier);
        }
    }

    private static URI parseProbableURI(String scriptIdentifier) {
        URI uri = URI.create(scriptIdentifier);
        return "file".equals(uri.getScheme()) ? parseAssumeFileScheme(uri.getSchemeSpecificPart()) : uri;
    }

    private static boolean isWindowsOS() {
        String osName = System.getProperty("os.name");
        return normalize(osName).contains("windows");
    }

    private static boolean pathContainsWindowsDrivePattern(String scriptIdentifier) {
        return scriptIdentifier.matches("^[a-zA-Z]:.*$");
    }

    private static boolean probablyURI(String scriptIdentifier) {
        return scriptIdentifier.matches("^[a-zA-Z+.\\-]+:.*$");
    }

    private static String replaceNonStandardPathSeparator(String scriptIdentifier) {
        return scriptIdentifier.replace(File.separatorChar, '/');
    }

    private static boolean nonStandardPathSeparatorInUse(String scriptIdentifier) {
        return File.separatorChar != '/' && scriptIdentifier.contains(File.separator);
    }

    private static URI parseAssumeFileScheme(String scriptIdentifier) {
        File scriptFile = new File(scriptIdentifier);
        return scriptFile.toURI();
    }

    private static String normalize(String value) {
        return value == null ? "" : value.toLowerCase(Locale.US).replaceAll("[^a-z0-9]+", "");
    }
}
