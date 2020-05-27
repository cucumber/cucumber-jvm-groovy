# Transformers

Transformers are glue code like step definitions or hooks.
You have to define them in your glue classes.

Cucumber allows the following specific transformers:
- String to any type
- DocString (multiline string) to any type
- DataTable to any type
  - transform lines with named headers to any type
  - transform lines without headers to any type
  - transform tables to any type
  - transform cells content to any type

As well as default transformers for:
- String
- DataTable
  - lines with named headers
  - cells

## String to any

`ParameterType` annotation allows to transform a String value from a Cucumber expression to a custom type.

It is defined by a name (used in the steps definitions) and a regex.
Each group of the regex will map to a parameter of the transformation function.

For instance, the following transformer can be defined:
```groovy
class Point{
     int x
     int y

    Point(int x, int y) {
        this.x = x
        this.y = y
    }
}

@ParameterType(name = "coordinates", value = "(.+),(.+)")
Point pointTransformer(String x, String y){
    new Point(x.toInteger(), y.toInteger())
}

```

And used like this:
```gherkin
Given balloon coordinates 123,456 in the game
```

```groovy
Given(/balloon coordinates {coordinates} in the game/) { Point point ->
    //Do something
}
```

## DocString to any

`DocStringType` annotation allows to transform DocString values (multiline string) to a custom type.

For instance, the following transformer can be defined:
```groovy
class JsonText{
    String json

    JsonText(String json) {
        this.json = json
    }
}

@DocStringType(contentType = "json")
JsonText jsonTransformer(String json){
    new JsonText(json)
}
```

And used like this:
```gherkin
Given the following json text
"""json
{
"key": "value"
}
"""
```

```groovy
Given(/the following json text/) { JsonText jsonText ->
    //Do something
}
```

## DataTable to any

`DataTableType` allows to transform DataTable to a custom type.

This can be achieved in different ways:
- transform lines with named headers to any type
- transform lines without headers to any type
- transform tables to any type
- transform cells content to any type

Note that DataTables in Gherkin can not represent `null` or the empty string unambiguously.
Cucumber will interpret empty cells as `null`.
But you can use a replacement to represent empty strings.
See below.

See also the [Datatable reference](https://github.com/cucumber/cucumber/tree/master/datatable).

### Lines with named headers

For instance, the following transformer can be defined:
```groovy
class Author {
    String name
    String surname
    String famousBook

    Author(String name, String surname, String famousBook) {
        this.name = name
        this.surname = surname
        this.famousBook = famousBook
    }
}

@DataTableType
Author authorEntryTransformer(Map<String, String> entry) {
     new Author(
            entry.get("name"),
            entry.get("surname"),
            entry.get("famousBook"))
}
```

And used like this:
```gherkin
Given the following authors
| name   | surname | famousBook      |
| Alan   | Alou    | The Lion King   |
| Robert | Bob     | Le Petit Prince |
```

```groovy
Given(/the following authors/) { List<Author> authors ->
    //Do something with authors
}

// Or using DataTable
Given(/the following authors/) { DataTable table ->
    List<Author> authors = table.asList(Author)
    //Do something with authors
}
```

### Lines without headers

For instance, the following transformer can be defined:
```groovy
class Author {
    String name
    String surname
    String famousBook

    Author(String name, String surname, String famousBook) {
        this.name = name
        this.surname = surname
        this.famousBook = famousBook
    }
}

@DataTableType
Author authorEntryTransformer(List<String> row) {
     new Author(
            row.get(0),
            row.get(1),
            row.get(2))
}
```

And used like this:
```gherkin
Given the following authors
| Alan   | Alou    | The Lion King   |
| Robert | Bob     | Le Petit Prince |
```

```groovy
Given(/the following authors/) { List<Author> authors ->
    //Do something with authors
}

// Or using DataTable
Given(/the following authors/) { DataTable table ->
    List<Author> authors = table.asList(Author)
    //Do something with authors
}
```

### DataTable

For instance, the following transformer can be defined:
```groovy
class Author {
    String name
    String surname
    String famousBook

    Author(String name, String surname, String famousBook) {
        this.name = name
        this.surname = surname
        this.famousBook = famousBook
    }
}

class GroupOfAuthors{
    List<Author> authors

    GroupOfAuthors(List<Author> authors) {
        this.authors = authors
    }
}

@DataTableType
GroupOfAuthors authorEntryTransformer(DataTable table) {
    List<Author> authors = table.asMaps().stream()
                                          .map({ entry -> new Author(entry.get("name"), entry.get("surname"), entry.get("famousBook")) })
                                          .collect(Collectors.toList())
     new GroupOfAuthors(authors)
}
```

_Please note that the same transformation could be done using a line transformer._
_The purpose of this transformer is to show the syntax._

And used like this:
```gherkin
Given the following authors
| name   | surname | famousBook      |
| Alan   | Alou    | The Lion King   |
| Robert | Bob     | Le Petit Prince |
```

```groovy
Given(/the following authors/) { DataTable table ->
   def authors = table.convert(GroupOfAuthors,false)
}
```

### Cell

For instance, the following transformer can be defined:
```groovy
class RichCell{
    String content

    RichCell(String content) {
        this.content = content
    }
}

@DataTableType
RichCell transformCell(String content){
    new RichCell(content)
}
```

And used like this:
```gherkin
Given the following authors
| Alan   | Alou    | The Lion King   |
| Robert | Bob     | Le Petit Prince |
```

```groovy
Given(/the following authors/) { List<List<RichCell>> authors ->
   //Do something with authors
}

// Or using DataTable
Given(/the following authors/) { DataTable table->
    def authors = table.asLists(RichCell)
   //Do something with authors
}
```

Or with headers like this:
```gherkin
Given the following authors
| name   | surname | famousBook      |
| Alan   | Alou    | The Lion King   |
| Robert | Bob     | Le Petit Prince |
```

```groovy
Given(/the following authors/) { List<Map<String,RichCell>> authors ->
   //Do something with authors
}

// Or using DataTable
Given(/the following authors/) { DataTable table->
    def authors = table.asMaps(String,RichCell)
   //Do something with authors
}
```

### Empty values

By default empty values in DataTable are treated as `null` by Cucumber.
If you need to have empty values, you can define a replacement like `[empty]` that will be automatically replaced to empty when parsing DataTable.

To do so, you can add a parameter to a `DataTableType` definition.

For instance, with the following definition:
```groovy
class Author {
    String name
    String surname
    String famousBook

    Author(String name, String surname, String famousBook) {
        this.name = name
        this.surname = surname
        this.famousBook = famousBook
    }
}

@DataTableType(replaceWithEmptyString = "[empty]")
Author authorEntryTransformer(List<String> row) {
    new Author(
            row.get(0),
            row.get(1),
            row.get(2))
}
```

And the following step:
```gherkin
Given the following authors
| name    | surname | famousBook      |
| Alan    | Alou    | The Lion King   |
| [empty] | Bob     | Le Petit Prince |
```

You would actually get a list containing `Author{name='Alan', surname='Alou', famousBook='The Lion King'}` and `Author{name='', surname='Bob', famousBook='Le Petit Prince'}`.

## Default transformers

Default transformers are used when there is no specific transformer.

They can be used with object mappers like Jackson to easily convert from well known strings to objects.

### String

For instance, the following definition:
```groovy
@DefaultParameterTransformer
Object anonymous(String fromValue, Type toValueType) {
    ObjectMapper objectMapper = new ObjectMapper()
    objectMapper.convertValue(fromValue, objectMapper.constructType(toValueType));
}
```

Will be used to convert with such step definitions:
```groovy
Given("A step with a undefined {} string") { SomeType someType ->
  // The string between {} will be converted to SomeType
}
```

### DataTable

#### Lines with named headers

For instance the following definition:
```groovy
class Author {
    @JsonProperty("name")
    String name
    @JsonProperty("surname")
    String surname
    @JsonProperty("famousBook")
    String famousBook
}
@DefaultDataTableEntryTransformer(replaceWithEmptyString = "[empty]")
Object defaultTableEntryTransformer(Map<String,String> fromValue, Type toValueType) {
    ObjectMapper objectMapper = new ObjectMapper()
    objectMapper.convertValue(fromValue, objectMapper.constructType(toValueType));
}
```

Will be used to convert with such step definitions:
```groovy
Given(/the following authors/) { List<Author> authors ->
   //Do something with authors
}

// Or DataTable
Given(/the following authors/) { DataTable table ->
    def authors = table.asList(Author1)
   //Do something with authors
}
```

#### Cells

For instance the following definition:
```groovy
class RichCell{
    String content
    RichCell(String content){
        this.content = content
    }
}

@DefaultDataTableCellTransformer(replaceWithEmptyString = "[empty]")
Object defaultTableEntryTransformer(String fromValue, Type toValueType) {
    ObjectMapper objectMapper = new ObjectMapper()
    objectMapper.convertValue(fromValue, objectMapper.constructType(toValueType));
}
```

Will be used to convert with such step definitions:
```groovy
Given(/the following authors/) { List<List<RichCell>> authors ->
   //Do something with authors
}

// Or DataTable
Given(/the following authors/) { DataTable table ->
    def authors = table.asLists(RichCell)
}
```
