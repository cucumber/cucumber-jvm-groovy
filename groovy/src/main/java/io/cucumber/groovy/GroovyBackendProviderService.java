package io.cucumber.groovy;

import com.google.auto.service.AutoService;
import io.cucumber.core.backend.Backend;
import io.cucumber.core.backend.BackendProviderService;
import io.cucumber.core.backend.Container;
import io.cucumber.core.backend.Lookup;

import java.util.function.Supplier;

@AutoService(BackendProviderService.class)
public final class GroovyBackendProviderService implements BackendProviderService {
    @Override
    public Backend create(Lookup lookup, Container container, Supplier<ClassLoader> classLoaderSupplier) {
        return new GroovyBackend(lookup, container, classLoaderSupplier);
    }
}
