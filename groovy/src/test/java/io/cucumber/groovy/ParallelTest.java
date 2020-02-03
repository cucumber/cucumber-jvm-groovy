package io.cucumber.groovy;


import groovy.lang.Closure;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.function.Supplier;


@RunWith(MockitoJUnitRunner.class)
public class ParallelTest {
    @Mock
    Supplier<ClassLoader> classLoaderSupplier;
    @Mock
    Closure closure;

    @Test
    public void can_have_a_new_backend_on_a_different_thread() {
        new GroovyBackend(null, null, classLoaderSupplier);
        Thread interactWithBackendThread = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    GroovyBackend.getInstance().registerWorld(closure);
                } catch (NullPointerException e) {
                    // This is what we want as there should be no GroovyBackend on this thread
                }
            }
        });
        runAndWait(interactWithBackendThread);
        GroovyBackend.getInstance().registerWorld(closure);
    }

    private void runAndWait(Thread interactWithBackendThread) {
        interactWithBackendThread.start();
        try {
            interactWithBackendThread.join();
        } catch (InterruptedException e) {
            throw new RuntimeException("Doh");
        }
    }
}
