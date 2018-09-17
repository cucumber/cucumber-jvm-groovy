package cucumber.runtime.groovy;

import cucumber.runtime.io.ResourceLoader;
import groovy.lang.Closure;
import io.cucumber.stepexpression.TypeRegistry;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import java.util.Locale;


@RunWith(MockitoJUnitRunner.class)
public class ParallelTest {
    @Mock
    ResourceLoader resourceLoader;
    @Mock
    Closure closure;

    @Test
    public void can_have_a_new_backend_on_a_different_thread() {
        new GroovyBackend(resourceLoader, new TypeRegistry(Locale.ENGLISH));
        Thread interactWithBackendThread = new Thread(new Runnable(){
            @Override
            public void run() {
                try {
                    GroovyBackend.getInstance().registerWorld(closure);
                } catch (NullPointerException e){
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
