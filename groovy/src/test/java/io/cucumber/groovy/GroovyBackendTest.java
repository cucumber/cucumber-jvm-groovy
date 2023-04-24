package io.cucumber.groovy;

import io.cucumber.core.backend.Container;
import io.cucumber.core.backend.Lookup;
import org.codehaus.groovy.runtime.MethodClosure;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.function.Supplier;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

@ExtendWith(MockitoExtension.class)
public class GroovyBackendTest {
    @Mock
    Lookup lookup;

    @Mock
    Container container;

    @Mock
    GroovyBackend backend;

    @Mock
    Supplier<ClassLoader> classLoaderSupplier;

    @BeforeEach
    public void setUp() {
        backend = new GroovyBackend(lookup, container, classLoaderSupplier);
    }

    @Test
    public void should_build_world_by_calling_the_closure() {
        backend.registerWorld(new MethodClosure(this, "worldClosureCall"));
        backend.buildWorld();

        GroovyWorld groovyWorld = backend.getGroovyWorld();
        assertEquals(1, groovyWorld.worldsCount());
    }

    @Test
    public void should_build_world_object_even_if_closure_world_was_not_added() {
        assertNull(backend.getGroovyWorld());

        backend.buildWorld();

        assertEquals(0, backend.getGroovyWorld().worldsCount());
    }

    @Test
    public void should_clean_up_worlds_after_dispose() {
        backend.registerWorld(new MethodClosure(this, "worldClosureCall"));
        backend.buildWorld();

        backend.disposeWorld();

        assertNull(backend.getGroovyWorld());
    }

    @SuppressWarnings("UnusedDeclaration")
    private AnotherCustomWorld worldClosureCall() {
        return new AnotherCustomWorld();
    }
}
