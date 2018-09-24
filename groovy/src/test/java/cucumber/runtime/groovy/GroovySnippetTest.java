package cucumber.runtime.groovy;

import cucumber.runtime.snippets.SnippetGenerator;
import gherkin.pickles.Argument;
import gherkin.pickles.PickleCell;
import gherkin.pickles.PickleLocation;
import gherkin.pickles.PickleRow;
import gherkin.pickles.PickleStep;
import gherkin.pickles.PickleString;
import gherkin.pickles.PickleTable;
import io.cucumber.stepexpression.TypeRegistry;
import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;

public class GroovySnippetTest {

    private static final List<Argument> NO_ARGUMENTS = Collections.emptyList();
    private static final List<PickleLocation> NO_LOCATIONS = Collections.emptyList();

    @Test
    public void generatesPlainSnippet() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes in my {string} belly/) { Integer int1, String string ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have 4 cukes in my \"big\" belly"));
    }

    @Test
    public void generatesCopyPasteReadyStepSnippetForNumberParameters() throws Exception {
        List<String> expected = Collections.singletonList("" +
                "Given(/before {int} after/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("before 5 after"));
    }

    @Test
    public void generatesCopyPasteReadySnippetWhenStepHasIllegalJavaIdentifierChars() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes in: my {string} red-belly!/) { Integer int1, String string ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have 4 cukes in: my \"big\" red-belly!"));
    }


    @Test
    public void generatesCopyPasteReadySnippetWhenStepHasIntegersInsideStringParameter() {
        List<String> expected = Collections.singletonList("" +
                "Given(/the DI system receives a message saying {string}/) { String string ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("the DI system receives a message saying \"{ dataIngestion: { feeds: [ feed: { merchantId: 666, feedId: 1, feedFileLocation: feed.csv } ] }\""));
    }

    @Test
    public void generatesSnippetWithEscapedDollarSigns() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have ${int}/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have $5"));
    }

    @Test
    public void generatesSnippetWithEscapedParentheses() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes \\\\(maybe more)/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have 5 cukes (maybe more)"));
    }

    @Test
    public void generatesSnippetWithEscapedBrackets() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes [maybe more]/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetFor("I have 5 cukes [maybe more]"));
    }

    @Test
    public void generatesSnippetWithDocString() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have:/) { String docString ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");
        assertEquals(expected, snippetForDocString("I have:", new PickleString(null, "hello")));
    }

    @Test
    public void generatesSnippetWithDataTable() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have:/) { io.cucumber.datatable.DataTable dataTable ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");
        PickleTable dataTable = new PickleTable(asList(new PickleRow(asList(new PickleCell(null, "col1")))));
        assertEquals(expected, snippetForDataTable("I have:", dataTable));
    }

    @Test
    public void generateSnippetWithEscapedEscapeCharacter() {
        List<String> expected = Collections.singletonList("" +
                "Given(/I have {int} cukes in my belly/) { Integer int1 ->\n" +
                "    // Write code here that turns the phrase above into concrete actions\n" +
                "    throw new PendingException()\n" +
                "}\n");

        assertEquals(expected, snippetFor("I have 4 cukes in my belly"));
    }

    private List<String> snippetFor(String name) {
        PickleStep step = new PickleStep(name, NO_ARGUMENTS, NO_LOCATIONS);
        return new SnippetGenerator(new GroovySnippet(),  new TypeRegistry(Locale.ENGLISH).parameterTypeRegistry()).getSnippet(step, "Given", null);
    }

    private List<String> snippetForDocString(String name, PickleString docString) {
        PickleStep step = new PickleStep(name, asList((Argument) docString), NO_LOCATIONS);
        return new SnippetGenerator(new GroovySnippet(),new TypeRegistry(Locale.ENGLISH).parameterTypeRegistry()).getSnippet(step, "Given", null);
    }

    private List<String> snippetForDataTable(String name, PickleTable dataTable) {
        PickleStep step = new PickleStep(name, asList((Argument) dataTable), NO_LOCATIONS);
        return new SnippetGenerator(new GroovySnippet(),new TypeRegistry(Locale.ENGLISH).parameterTypeRegistry()).getSnippet(step, "Given", null);
    }
}
