#!/usr/bin/env groovy
__directory = new File(getClass().getProtectionDomain().getCodeSource().getLocation().getPath()).getParent();
this.class.classLoader.addURL(new File(__directory, "cucumber-groovy-shaded.jar").toURL())
this.class.classLoader.loadClass("io.cucumber.core.cli.Main").main(args)
