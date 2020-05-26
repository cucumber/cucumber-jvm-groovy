package io.cucumber.groovy

class Author {
    final String firstName
    final String lastName
    final birthDate

    Author(String firstName, String lastName, String birthDate) {
        this.firstName = firstName
        this.lastName = lastName
        this.birthDate = birthDate
    }

    @Override
    String toString() {
        return "io.cucumber.groovy.Author{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", birthDate='" + birthDate + '\'' +
                '}'
    }

    @Override
    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false
        Author author = (Author) o

        if (birthDate != author.birthDate) return false
        if (firstName != author.firstName) return false
        if (lastName != author.lastName) return false
        return true
    }

    @Override
    int hashCode() {
        int result
        result = (firstName != null ? firstName.hashCode() : 0)
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0)
        result = 31 * result + (birthDate != null ? birthDate.hashCode() : 0)
        return result
    }
}