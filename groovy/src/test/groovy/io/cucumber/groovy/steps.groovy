package io.cucumber.groovy

import io.cucumber.datatable.DataTable

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertTrue

this.metaClass.mixin(EN)

final Author expectedAuthor = new Author("Annie M. G.", "Schmidt", "1911-03-20")
final Person expectedPerson = new Person("Astrid", "Lindgren")
final Person mononymousPerson = new Person("Plato", "")

@DataTableType
Author singleAuthorTransformer(DataTable table) {
    return authorEntryTransformer(table.asMaps().get(0))
}

@DataTableType
static Author authorEntryTransformer(Map<String, String> entry) {
    return new Author(
            entry.get("firstName"),
            entry.get("lastName"),
            entry.get("birthDate"))
}

Given("a list of authors in a table") { List<Author> authors ->
    assertTrue(authors.contains(expectedAuthor))
}


Given("a single author in a table") {
    Author author ->
        assertEquals(expectedAuthor, author)
}


Given("a list of people in a table") { List<Person> persons ->
    assertTrue(persons.contains(expectedPerson))
    assertTrue(persons.contains(mononymousPerson))
}

@DataTableType(replaceWithEmptyString = "[blank]")
static Person transformPerson(Map<String, String> tableEntry) {
    return new Person(tableEntry.get("first"), tableEntry.get("last"))
}

