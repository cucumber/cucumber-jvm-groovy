# DataTables

Cucumber Groovy support DataTables with Java types.

See below the exhaustive list of possible mappings.

## As Map of Map

```gherkin
Given the following table as Map of Map
|      | key1  | key2  | key3  |
| row1 | val11 | val12 | val13 |
| row2 | val21 | val22 | val23 |
| row3 | val31 | val32 | val33 |
```

```groovy
Given("the following table as Map of Map") { Map<Map<String>> table->
  // Map{
  //    "row1" : Map{"key1" : "val11", "key2" : "val12", "key3" : "val13"},
  //    "row2" : Map{"key1" : "val21", "key2" : "val22", "key3" : "val23"},
  //    "row3" : Map{"key1" : "val31", "key2" : "val32", "key3" : "val33"}
  // }
}
```

## As List of Map

```gherkin
Given the following table as List of Map
| key1  | key2  | key3  |
| val11 | val12 | val13 |
| val21 | val22 | val23 |
| val31 | val32 | val33 |
```

```groovy
Given("the following table as List of Map") { List<Map<String>> table ->
  // List[
  //   Map("key1" -> "val11", "key2" -> "val12", "key3" -> "val13"),
  //   Map("key1" -> "val21", "key2" -> "val22", "key3" -> "val23"),
  //   Map("key1" -> "val31", "key2" -> "val32", "key3" -> "val33")
  // ]
}
```

## As Map of List

```gherkin
Given the following table as Map of List
| row1 | val11 | val12 | val13 |
| row2 | val21 | val22 | val23 |
| row3 | val31 | val32 | val33 |
```

```groovy
Given("the following table as Map of List") { Map<List<String>> table->
  // Map{
  //   "row1" : List["val11", "val12", "val13"],
  //   "row2" : List["val21", "val22", "val23"],
  //   "row3" : List["val31", "val32", "val33"]
  // }
}
```


## As List of List

```gherkin
Given the following table as List of List
| val11 | val12 | val13 |
| val21 | val22 | val23 |
| val31 | val32 | val33 |
```

```groovy
Given("the following table as List of List") { List<List<String>> table ->
  // List[
  //   List["val11", "val12", "val13"],
  //   List["val21", "val22", "val23"],
  //   List["val31", "val32", "val33"]
  // ]
}
```

## As Map

```gherkin
Given the following table as Map
| row1 | val11 |
| row2 | val21 |
| row3 | val31 |
```

```groovy
Given("the following table as Map") { Map<String> table->
  // Map{
  //   "row1" : "val11",
  //   "row2" : "val21",
  //   "row3" : "val31"
  // {
}
```

## As List

```gherkin
Given the following table as List
| val11 |
| val21 |
| val31 |
```

```groovy
Given("the following table as List") { List<String> table->
  // List[
  //   "val11",
  //   "val21",
  //   "val31"
  // ]
}
```

## As DataTable

```gherkin
Given the following table as DataTable
# Any previous table definition is possible
| key1  | key2  | key3  |
| val11 | val12 | val13 |
| val21 | val22 | val23 |
| val31 | val32 | val33 |
```

```groovy
Given("the following table as DataTable") { DataTable table->
  // Use the table any way you want, including any of the options defined previously
}
```
