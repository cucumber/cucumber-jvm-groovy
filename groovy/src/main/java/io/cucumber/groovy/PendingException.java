package io.cucumber.groovy;

import io.cucumber.core.backend.Pending;
import org.apiguardian.api.API;

@Pending
public final class PendingException extends RuntimeException {

    public PendingException() {
        this("TODO: implement me");
    }

    public PendingException(String message) {
        super(message);
    }

}