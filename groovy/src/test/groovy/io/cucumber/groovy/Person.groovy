package io.cucumber.groovy

class Person {
    private final String first
    private final String last

    Person(String first, String last) {
        this.first = first
        this.last = last
    }

    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        Person person = (Person) o

        if (first != person.first) return false
        if (last != person.last) return false

        return true
    }

    int hashCode() {
        int result
        result = (first != null ? first.hashCode() : 0)
        result = 31 * result + (last != null ? last.hashCode() : 0)
        return result
    }
}