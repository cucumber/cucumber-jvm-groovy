package io.cucumber.groovy;

import io.cucumber.core.gherkin.Feature;
import io.cucumber.core.gherkin.Step;
import io.cucumber.core.snippets.SnippetGenerator;
import io.cucumber.core.snippets.SnippetType;
import io.cucumber.cucumberexpressions.ParameterTypeRegistry;
import org.junit.jupiter.api.Test;

import java.util.Collections;
import java.util.List;
import java.util.Locale;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class GroovySnippetTest {

    @Test
    public void generatesPlainSnippet() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes in my {string} belly/) { Integer int1, String string ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have 4 cukes in my \"big\" belly"));
    }

    @Test
    public void generatesCopyPasteReadyStepSnippetForNumberParameters() {
        List<String> expected = Collections.singletonList("" +
                "Given(/before {int} after/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("before 5 after"));
    }

    @Test
    public void generatesCopyPasteReadySnippetWhenStepHasIllegalJavaIdentifierChars() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes in: my {string} red-belly!/) { Integer int1, String string ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have 4 cukes in: my \"big\" red-belly!"));
    }

    @Test
    public void generatesCopyPasteReadySnippetWhenStepHasIntegersInsideStringParameter() {
        List<String> expected = Collections.singletonList("" +
                "Given(/the DI system receives a message saying {string}/) { String string ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor(
            "the DI system receives a message saying \"{ dataIngestion: { feeds: [ feed: { merchantId: 666, feedId: 1, feedFileLocation: feed.csv } ] }\""));
    }

    @Test
    public void generatesSnippetWithEscapedDollarSigns() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have ${int}/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have $5"));
    }

    @Test
    public void generatesSnippetWithEscapedParentheses() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes \\\\(maybe more)/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have 5 cukes (maybe more)"));
    }

    @Test
    public void generatesSnippetWithEscapedBrackets() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes [maybe more]/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have 5 cukes [maybe more]"));
    }

    @Test
    public void generatesSnippetWithDocString() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have:/) { String docString ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetForDocString("I have:", "hello"));
    }

    @Test
    public void generatesSnippetWithDataTable() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have:/) { io.cucumber.datatable.DataTable dataTable ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetForDataTable("I have:"));
    }

    @Test
    public void generateSnippetWithEscapedEscapeCharacter() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes in my belly/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new io.cucumber.groovy.PendingException()\n" +
                "}\n");

        assertEquals(expected, snippetFor("I have 4 cukes in my belly"));
    }

    private List<String> snippetFor(String name) {
        Step step = createStep(name);
        return new SnippetGenerator(new GroovySnippet(), new ParameterTypeRegistry(Locale.ENGLISH)).getSnippet(step,
            SnippetType.UNDERSCORE);
    }

    private List<String> snippetForDocString(String name, String docString) {
        Step step = createStepWithDocString(name, docString);
        return new SnippetGenerator(new GroovySnippet(), new ParameterTypeRegistry(Locale.ENGLISH)).getSnippet(step,
            SnippetType.UNDERSCORE);
    }

    private List<String> snippetForDataTable(String name) {
        Step step = createStepWithDataTable(name);
        return new SnippetGenerator(new GroovySnippet(), new ParameterTypeRegistry(Locale.ENGLISH)).getSnippet(step,
            SnippetType.UNDERSCORE);
    }

    private Step createStepWithDataTable(String stepText) {
        String source = "" +
                "Feature: Test feature\n" +
                "  Scenario: Test Scenario\n" +
                "    Given " + stepText + "\n" +
                "      | key   | \n" +
                "      | value | \n";

        Feature feature = TestFeatureParser.parse(source);
        return feature.getPickles().get(0).getSteps().get(0);
    }

    private Step createStep(String stepText) {
        String source = "" +
                "Feature: Test feature\n" +
                "  Scenario: Test Scenario\n" +
                "    Given " + stepText + "\n";

        Feature feature = TestFeatureParser.parse(source);
        return feature.getPickles().get(0).getSteps().get(0);
    }

    private Step createStepWithDocString(String stepText, String docString) {
        String source = "" +
                "Feature: Test feature\n" +
                "  Scenario: Test Scenario\n" +
                "    Given " + stepText + "\n" +
                "      \"\"\"\n" +
                "      " + docString + "\n" +
                "      \"\"\"";

        Feature feature = TestFeatureParser.parse(source);
        return feature.getPickles().get(0).getSteps().get(0);
    }

}
