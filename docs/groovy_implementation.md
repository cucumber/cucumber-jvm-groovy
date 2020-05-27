# Groovy implementation details

This page covers some details about the Cucumber Groovy implementation.

## Running a Cucumber test

### Backend

From Cucumber core perspective, the entry point of a Cucumber implementation is what is called "backend".

The `BackendServiceLoader` core service looks for a `BackendProviderService` implementation.
Ours is defined in the class `GroovyBackendProviderService`.

The implementing class also has to be registered as a "Java Service" in the `META-INF/services/io.cucumber.core.backend.BackendProviderService` file (in the `resources` folder).

### Loading the glue

When a Cucumber test starts, a Cucumber Runner starts and a `GroovyBackend` instance is created.
The `GroovyBackend` instance will be used for running all the scenarios which are part of the test (defined by the _features path_ and the _glue path_).

The first thing the Runner does is to "load the glue", that is find all the hooks and step definitions and register them.
This is handled by the `GroovyBackend#loadGlue()` method.

#### Groovy implementation

In the Cucumber Groovy implementation, loading the glue code means:
- finding all the compiled **scripts** in the _glue path_, and for each:
  - extract the hooks and step definitions from it
  - add it to the `Container` instance provided by Cucumber Core
- finding all the interpreted **scripts** in the _glue path_ and for each:
  - extract the hooks and step definitions from it
  - add it to the `Container` instance provided by Cucumber Core


