package io.cucumber.groovy;

import groovy.lang.Closure;
import io.cucumber.groovy.*;
import java.util.Arrays;
import java.util.regex.Pattern;

public class ${normalized_language} {
<% i18n.stepKeywords.findAll { !it.contains('*') && !it.matches("^\\d.*") }.unique().each { kw -> %>

    public static void ${java.text.Normalizer.normalize(kw.replaceAll("[\\s',!\u2019]", ""), java.text.Normalizer.Form.NFC)}(String[] expressions, Closure body) throws Throwable {
        Arrays.stream(expressions).forEach(expression->
              GroovyBackend.getInstance().addStepDefinition(expression, body)
        );
    }

    public static void ${java.text.Normalizer.normalize(kw.replaceAll("[\\s',!\u2019]", ""), java.text.Normalizer.Form.NFC)}(Pattern[] regexps, Closure body) throws Throwable {
         Arrays.stream(regexps).forEach(regexp->
               GroovyBackend.getInstance().addStepDefinition(regexp.toString(), body)
         );
    }

    public static void ${java.text.Normalizer.normalize(kw.replaceAll("[\\s',!\u2019]", ""), java.text.Normalizer.Form.NFC)}(String expression, Closure body) throws Throwable {
        GroovyBackend.getInstance().addStepDefinition(expression, body);
    }

    public static void ${java.text.Normalizer.normalize(kw.replaceAll("[\\s',!\u2019]", ""), java.text.Normalizer.Form.NFC)}(Pattern regexp, Closure body) throws Throwable {
        GroovyBackend.getInstance().addStepDefinition(regexp.toString(), body);
    }
<% } %>
}
