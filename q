[33mcommit 3635a493db4c71bcbbc5844e87cac7deebc94687[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: Glib Briia <glib.briia@gmail.com>
Date:   Sat Sep 15 13:18:14 2018 +0100

    Migrate to cucumber jvm 3.0.2

[33mcommit 67b29a58b550e18321951d2115714cfeb0b14d5e[m[33m ([m[1;31morigin/master[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: Marit van Dijk <mlvandijk@gmail.com>
Date:   Sun Mar 18 06:53:42 2018 +0100

    Add Maven central badge

[33mcommit 2c9498017114b008a599450d4a45ad86bbc5f2fc[m
Author: Marit van Dijk <mlvandijk@gmail.com>
Date:   Sat Mar 10 09:12:20 2018 +0100

    Add Maven dependency

[33mcommit 11d88f32468d719c614f65165b2ac48db1864326[m
Author: M.P. Korstanje <rien.korstanje@gmail.com>
Date:   Thu Oct 12 21:04:35 2017 +0200

    Add examples

[33mcommit 8e290fb0185ef65e9901f06120a3d94f633b321d[m
Author: M.P. Korstanje <rien.korstanje@gmail.com>
Date:   Wed Sep 20 20:09:51 2017 +0200

    [Spring] Throw exception when step definitions are annotated with component
    
    When step definitions are annotated with @Component or other related
    annotations they can be picked up by springs class path scanning. This
    conflicts with cucumbers class path scanning and may result in
    multiple bean definitions for the same class.
    
    This problem is hard to understand and hard to trace. By making the
    problem explicit and providing a clear instruction on how to resolve
    this we can hopefully avoid future confusion.
    
    The current implementation only checks the a subset of all annotations.
    This will hopefully be sufficient.
    
    Closes #1225

[33mcommit 0a4da49552c9c10975688f92b15b820f7b38df15[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Sun Sep 17 09:44:01 2017 +0200

    [maven-release-plugin] prepare for next development iteration

[33mcommit f82dfe5396d47ba161458535444ab755823b9b71[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Sun Sep 17 09:43:49 2017 +0200

    [maven-release-plugin] prepare release v2.0.1

[33mcommit 15a752e80daa16e9935db1eae756f952f470dc76[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Tue Aug 29 19:23:54 2017 +0200

    [maven-release-plugin] prepare for next development iteration

[33mcommit a8f13b4fb11c63500fac4ce5f996bc185547a11f[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Tue Aug 29 19:23:30 2017 +0200

    [maven-release-plugin] prepare release v2.0.0

[33mcommit def9a3c35cfd66dc767b1edeb28985cd6579db20[m
Author: M.P. Korstanje <rien.korstanje@gmail.com>
Date:   Fri Aug 11 22:56:25 2017 +0200

    Fix code coverage by coverals.io
    
    Every aspect of the build should be uniform and universally executable.
    Replacing the shell script with a maven plugin should achieve this.
    
    Coverage is calculated only after successful build to ensure that the
    tests pass without the instrumentation installed by cobertura.
    
    The examples section is excluded. While examples execute code they
    do not properly test it.
    
    Clojure is excluded because it does not quite follow the class to
    source naming conventions of java. Cobertura relies on these to
    find the right source for each class

[33mcommit 49345eaf2c12b47b9f563a7a915935840a1c48be[m
Author: M.P. Korstanje <rien.korstanje@gmail.com>
Date:   Fri Aug 11 21:36:47 2017 +0200

    Remove relative path to parent pom
    
    Maven relies on convention over configuration. By convention the
    `relativePath` is `../pom.xml` and can be ommited from the pom file[1].
    
    References:
     1. https://maven.apache.org/guides/introduction/introduction-to-the-pom.html#Project_Inheritance

[33mcommit 46605091241ebc71f2b22debb2792c27601a3cd1[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Thu Jul 6 19:33:54 2017 +0200

    Bump the version of the cucumber-jvm-deps dependency.
    
    Also handle that cucumber-jvm-deps has changed groupId.

[33mcommit d0054091bbb56686a0842a0a9872dd64b9840678[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Tue Sep 6 20:13:11 2016 +0200

    Use the tag-expressions library.
    
    Use the new tag-expressions library, but support both the use of the new
    tag expression syntax and the old tag expression syntax.

[33mcommit 7e6d7e0b58db6308f07ba3ce8d7a40bd77970bdf[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Sat Jul 16 14:23:30 2016 +0200

    [Groovy] Udated groovy for the use of Gherkin v4.0.0.

[33mcommit 4792aa53ae6295f626a44ff829a8b2f167959978[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Sun Jul 31 19:28:12 2016 +0200

    Change the maven groupId to io.cucumber.

[33mcommit e5091af23ce0f21c5218e1bce512827870bd5a6d[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Sat Jul 16 14:09:40 2016 +0200

    Update versions to 2.0.0-SNAPSHOT and gherkin to 4.0.0.

[33mcommit c1b5241d1c4f9860a27799b6c8fa42d43b26f46f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Sep 12 23:00:54 2016 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 30e095a69a3543c8f7ba589e4576dc3a60f63fa4[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Sep 12 23:00:47 2016 +0100

    [maven-release-plugin] prepare release v1.2.5

[33mcommit 80b784f6ea0c2d07a6c5b25a21782735acc3446b[m
Author: Steffen Jacobs <steffen.jacobs@otto.de>
Date:   Thu Mar 31 21:41:37 2016 +0200

    Test added: Fixed NPE in List parameter conversion

[33mcommit f1a5098548952b624129ea95d5ff638a22c2cdcd[m
Author: Steffen Jacobs <steffen.jacobs@gmail.com>
Date:   Thu Mar 31 21:16:30 2016 +0200

    Fixed: Using List as step def parameter caused NPE
    
    ParameterInfo wasn't correctly initialized

[33mcommit fe5314f71d18001987458529f5b95ca66eddd70a[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jul 23 08:38:57 2015 -0500

    [maven-release-plugin] prepare for next development iteration

[33mcommit 378a07e7c04830dc025261c258cb090d6b101860[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jul 23 08:38:54 2015 -0500

    [maven-release-plugin] prepare release v1.2.4

[33mcommit ed8e2e04d80adb1d3488ddd9fd3fcfd90dd921c8[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jul 14 14:32:49 2015 +0200

    DocString arguments can be converted to scalar types just like capture group arguments

[33mcommit 639960b34049d956f54ce6b620b2260a043ed38c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jul 7 20:43:10 2015 +0200

    [maven-release-plugin] prepare for next development iteration

[33mcommit 4611433eccfb983fbc18de0c13dd0bdf1df3eced[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jul 7 20:43:01 2015 +0200

    [maven-release-plugin] prepare release v1.2.3

[33mcommit 1aabc2a9ae16a5cb91c678a6c288abcaba0ed8f8[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Mar 1 13:40:03 2015 +0000

    Revert to the original quoted snippet pattern. See cucumber/cucumber#663.

[33mcommit a1e38b7c600338d8023a5b4f65df6c4e7cfcedb4[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jan 13 22:34:03 2015 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit a7d0dbb0ba182265dd228aa9669054644dadcc1e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jan 13 22:33:55 2015 +0000

    [maven-release-plugin] prepare release v1.2.2

[33mcommit c615f902161bae53d002fb944c1655ca936a7d62[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jan 13 22:03:56 2015 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 3e18b86d794a2e8fecc1d13781bb7de60d053d88[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jan 13 21:54:26 2015 +0000

    Fix javadoc

[33mcommit 3d79be3a9629889765aec0fcf77b7342ddf0e6a7[m
Merge: 8a34a37 36c0384
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Thu Jan 1 19:01:14 2015 +0100

    Merge #809 "Add support for execution order for Groovy hooks".
    
    Update History.md.

[33mcommit 8a34a37421228406537777f015aba7b84ef7df20[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Thu Jan 1 18:59:40 2015 +0100

    Throw exception if two timeout or order arguments are found in Groovy hooks.

[33mcommit 5b7a1f4789c427cedc45100b7e51d83616d0da0d[m
Author: Mohammad Shamsi <m.h.shams@gmail.com>
Date:   Fri Dec 12 22:06:02 2014 +0100

    added support for execution order for "Before" and "After" hook. closes #807

[33mcommit 36c03849f44004e31ed06a28991eb438bc81e35f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Dec 12 12:48:36 2014 +0000

    Java 8 lambda step definitions. Closes #738, #767.
    
    Squashed commit of the following:
    
    commit a50a5a7d7c34f679fffc1396885b65038c904a24
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Fri Dec 12 12:48:11 2014 +0000
    
        Re-register stepdefs for each scenario in Java8
    
    commit aa5ce2b68201a631eda13c10e6a5a12c03b9d64a
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Thu Dec 11 13:28:28 2014 +0000
    
        Failing test for java8 state isolation
    
    commit d8cce7ba0ad4ae80fe50b0aa2d6d0847fbb12532
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Thu Dec 11 13:23:31 2014 +0000
    
        Clean up
    
    commit ef1cf06cbe9aa2449caef1b45b1a1fdd132e945f
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Thu Dec 11 12:07:04 2014 +0000
    
        Clean up the .io package
    
    commit c38de32f10c015ab628664ea50e5505ad21a0771
    Merge: 461beb9 cce054f
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Tue Dec 9 15:49:35 2014 +0000
    
        Merge branch 'master' into java8
    
    commit 461beb9cb106e90f7a166f8097f8b50baba256a6
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Tue Dec 9 15:48:47 2014 +0000
    
        More robust lookup of memberRef. Thanks @danielbodart. Ref #738
    
    commit af0844e67dddd03c33541c317cc84446e547a38b
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Thu Oct 30 13:14:39 2014 +0000
    
        [maven-release-plugin] prepare for next development iteration
    
    commit 9a3bdedeb37c21845caa14c8f2eaa14ddc4002ac
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Thu Oct 30 13:14:33 2014 +0000
    
        [maven-release-plugin] prepare release v1.2.0
    
    commit 9e00d6d693730558d83b986fd96ad7ca866dd913
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Thu Oct 30 13:05:30 2014 +0000
    
        Fix stupid javadoc errors that failed the build
    
    commit 51117d01f998a7770fc1a3eb0944e57625831477
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Thu Oct 30 12:36:32 2014 +0000
    
        Bump versions and misc cleanup
    
    commit 8c0e4f177c5b38018c842b9e96f5217a7e336acd
    Author: Björn Rasmusson <B.Rasmusson@computer.org>
    Date:   Fri Oct 31 21:30:13 2014 +0100
    
        Update the java8 module to version 1.2.1-SNAPSHOT
    
        All other modules are updated when merged to master.
    
    commit 363642a1f68e3d4effdc3ee85a870bac2dc44138
    Author: Björn Rasmusson <B.Rasmusson@computer.org>
    Date:   Fri Oct 31 20:05:52 2014 +0100
    
        Create the java8 profile, remove @FunctionalInterface from java
    
        Move the java8 module to a separate maven profile. Remove the
        @FunctionalInterface annotation from the java module so it build on
        java7. Add a java8 job to the Travis configuration to build the java8
        module.
    
    commit 9b5e9c0ffce5fcc5d1683d7b4ef7f30c335747a4
    Merge: 111e6f2 834f2bd
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Thu Oct 30 11:25:54 2014 +0000
    
        Merge branch 'master' into java8
    
    commit 111e6f2c290dca71ad2ffd4dcb7fec14727bab7f
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Tue Sep 2 12:42:42 2014 +0100
    
        Generate more methods so we don't need casting in the lambda DSL
    
    commit 1fa81c114a5cc522aaa133cb0c8e7019eda8a443
    Merge: 0f518b1 8e232b4
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Tue Sep 2 11:03:18 2014 +0100
    
        Merge branch 'master' into java8
    
    commit 0f518b1323c2036688aa10a127cb4a9f49a4f3dd
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Tue Sep 2 09:38:20 2014 +0100
    
        Add Java8 hooks
    
    commit e9375f11d6d32aad29017749b088459cbaaf3836
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Tue Sep 2 08:00:49 2014 +0100
    
        Use generics for Java8 lamdas. Use @danielbodart's hack
    
    commit 3c158688604f28e871b0a129c26f98ddb142d90a
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Mon Sep 1 13:09:42 2014 +0100
    
        More work on Java8
    
    commit 48f4ba53437c4ebf68c6bbe3bd568a643ce2319d
    Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
    Date:   Sun Aug 31 13:57:57 2014 +0100
    
        Java8 DSL, based on work by @rmannibucau. WIP.

[33mcommit 125b95945ecc1b1387f4639380dec05e7b9afc18[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 30 13:14:39 2014 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit fbee36d4a149267ef68e602d64acf9f2a4794061[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 30 13:14:33 2014 +0000

    [maven-release-plugin] prepare release v1.2.0

[33mcommit 8b2514ac30800c27380e0e3c3322a9e980b3d950[m
Merge: ed5689d c1aebf3
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Aug 29 15:05:06 2014 +0100

    Merge

[33mcommit ed5689d2529bbefb683026d27a2be3ae89dbbaa0[m
Merge: cc4b93f 77f7755
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Aug 29 14:24:54 2014 +0100

    Merge pull request #758 from tomdcc/clean-stack-traces
    
    Clean up groovy stack traces

[33mcommit cc4b93f11e2ed4c7350c0077d43a3a02ef360618[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Aug 8 14:18:34 2014 +0100

    Added --plugin option and misc other changes:
    
    * Richer plugin API
    * Removed support for `--dotcucumber` and `stepdefs.json`
    * The `--format` option is deprecated in favour of `--plugin`
    * `@cucumber.junit.api.Cucumber.Options` that was deprecated in 1.1.5 has been removed. Use `@cucumber.api.CucumberOptions`
    * Fix android build problems

[33mcommit 77f775590c240eaa4f63351f446514ddcd6debf9[m
Author: Tom Dunstan <github@tomd.cc>
Date:   Wed Aug 6 15:15:27 2014 +0930

    Clean up groovy stack traces
    
    Groovy stacktraces are basically unreadable, so any that are thrown we
    clean up using the groovy-provided StackTraceUtils class.

[33mcommit c1aebf34d75ace505b0b026bcba20f7bf7d4877f[m
Author: Luxor <atuzov@gmail.com>
Date:   Thu Jun 26 23:37:17 2014 +0400

    Groovy-Cucumber: support multiple World's: post review fix

[33mcommit 5faaed4098dfcb54baff80a2d552db1ae861056f[m
Author: Luxor <atuzov@gmail.com>
Date:   Fri May 9 21:15:37 2014 +0400

    Groovy-Cucumber: support multiple World's

[33mcommit f911294a258c8683d9bc4bb6522e71b08970775e[m
Author: Luxor <atuzov@gmail.com>
Date:   Thu Jun 26 23:37:17 2014 +0400

    Groovy-Cucumber: support multiple World's: post review fix

[33mcommit 051e0ef6232e61e1710c58108a4a30de3efcaa45[m
Merge: 6aea93f b4d3ac0
Author: Luxor <atuzov@gmail.com>
Date:   Thu Jun 26 22:09:12 2014 +0400

    Merge remote-tracking branch 'upstream/master'

[33mcommit b4d3ac0a04987faea3dcc29a850426c1a0b7f3ee[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jun 26 16:20:49 2014 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 896ab5c6b401e570b36cead547c110ee736c5541[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jun 26 16:20:44 2014 +0100

    [maven-release-plugin] prepare release v1.1.8

[33mcommit 7c7670e61bc646e0e2ec2a426e35824ab41d8129[m
Author: Bradley Hart <bhart@wiley.com>
Date:   Mon Jun 9 15:41:04 2014 +0100

    Added test for GroovyBackend to ensure the ThreadLocal is in place

[33mcommit 7e6bb69af8044c251f87be4473a7f51d08183481[m
Author: Bradley Hart <bhart@wiley.com>
Date:   Mon Jun 9 15:17:45 2014 +0100

    Fixing issue #723. Made the Groovy backend instance a thread local so that tests can run in parallel in the same JVM

[33mcommit ae770e6f87a1fceea19d6fc1813f0401c973d15d[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon May 19 12:13:52 2014 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit b30abe5752bdf4926195f87720b1483d188093b6[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon May 19 12:13:47 2014 +0100

    [maven-release-plugin] prepare release v1.1.7

[33mcommit 6aea93fe70d68584f1d289e770773584840256c1[m
Author: Luxor <atuzov@gmail.com>
Date:   Fri May 9 21:15:37 2014 +0400

    Groovy-Cucumber: support multiple World's

[33mcommit 510731da1003bd047bce6e0757b6df90ce197605[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Apr 23 10:57:11 2014 +0100

    Load scripts by absolute path rather than relative so that relative require/import from those scripts works

[33mcommit aa7271f48e15ca03303befbe0c9ba55867500740[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Mar 24 12:03:19 2014 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit db24b0f5f192c2fa4d7db6d6df3aa1cdaaf74031[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Mar 24 12:03:13 2014 +0000

    [maven-release-plugin] prepare release v1.1.6

[33mcommit 8ee011d7b34881c30715d1cb40d34871f3669827[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Mar 23 12:18:33 2014 +0000

    Use ~/.../ syntax in Groovy snippets, ref #663

[33mcommit 7fb0f2dcba08dc600ca8d52ed1de4eec6095f9d6[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 18 10:34:56 2014 +0000

    Simplify i18n build. Thanks @robertoandrade - ref #487

[33mcommit ae3a4e8be5966df8d36019b69ea63c641e46c886[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Mar 12 17:25:00 2014 +0000

    Align snippets for quoted arguments with cucumber-ruby

[33mcommit 1bf77ed98bd5c027b3575bccb091d4c7520b9853[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Mar 12 17:02:31 2014 +0000

    Minor refactoring

[33mcommit 7cb3269c1198a9c6099ceaab04341c8e60ee8a3b[m
Author: Björn Rasmusson <B.Rasmusson@computer.org>
Date:   Sat Nov 2 20:55:54 2013 +0100

    New Snippet text, closes #618.
    
    Change to the new Snippet text. Update History.md.
    Fix a one off error in JRubySnippet.java.

[33mcommit b7045cec4f3ca765d255b7a457657fc1e9a7945f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Oct 13 00:16:54 2013 +0100

    Refactored SnippetGenerator.
    
    There was too much parallel effort in the CamelCase and Underscore
    implementations, so the new structure shares most of the logic
    and implements the different logic in a Concatenator.
    
    I also made sure IntelliJ doesn't break because of the new
    scenario lifecycle methods in the gherkin formatter interface.

[33mcommit 35ce989823ef79562499d6e904cf4416d67dd4b0[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Sep 14 09:48:40 2013 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit f8a6c1607291efd7a949cab0b9bce6a11f56e14b[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Sep 14 09:48:33 2013 +0100

    [maven-release-plugin] prepare release v1.1.5

[33mcommit b9eb5276a9f9bcc6727683f451c4fc1df5cb077d[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Sep 12 09:46:29 2013 +0100

    Timeout is a long, not int. Be explicit that it's millis.

[33mcommit 582c3450e5e487424ab347f9041c5cb8c09fad20[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Sep 8 19:07:27 2013 +0100

    Remove duplication in Reflections implementations.
    
    Renamed Reflections to ClassFinder and removed generic methods.
    Created a new Reflections class that delegates to a ClassFinder.

[33mcommit aa721bbbe8af5d12ea0fd4b71b70a270c4e53d78[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Aug 13 22:02:38 2013 +0100

    Refactored --snippet option. Closes #561, #302

[33mcommit c9aeeac59fd529edc0faa5fff02b27e2e5369d52[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Aug 11 08:53:55 2013 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 1234e85465fabda67d1abf3d10cc3f43ab693f4e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Aug 11 08:53:48 2013 +0100

    [maven-release-plugin] prepare release v1.1.4

[33mcommit a28531d1e8d213612d4681b8878c1006d749df5f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jun 24 23:53:18 2013 -0500

    Refactoring for #525. WIP.

[33mcommit 0921fe78866bce56827ae1ac89b922157445afd6[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jun 10 15:43:21 2013 -0500

    Don't shade jruby/jython/groovy artifacts - only for native packages (gem,egg,zip). Closes #518, #522.

[33mcommit ee5f5a6a01cbb3bd63d5fd03b03ff0b6e8500bd4[m
Author: Dmytro Chyzhykov <dmytro.chyzhykov@yandex.ru>
Date:   Sun May 19 11:28:11 2013 +0300

    Got rid of Maven Shade Plugin wherever it was possible.
    
    Artefacts which still have need to use the plugin:
    
        - cucumber-groovy
        - cucumber-jython
        - cucumber-jruby

[33mcommit c4eb61624f200e5b021f155e3c5e6d99f30a490e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Apr 22 21:25:32 2013 +0100

    Upgrade to gherkin 2.12.0

[33mcommit 43723f16e32cbbaa2da1b3c9f842cb50384706ae[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 12 17:22:41 2013 +0000

    Added Transform example for Groovy. Ref #470. Will close this issue after the web site has been updated.

[33mcommit 6b4749c8c385f55cdf066c39758ed71e112371e0[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Mar 10 23:40:56 2013 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 745c9d3638b0748ac4d938150683284167befb82[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Mar 10 23:40:48 2013 +0000

    [maven-release-plugin] prepare release v1.1.3

[33mcommit 3cbb40586dd8662adcb443f0d1540ee457996ef4[m
Author: Luxor <atuzov@gmail.com>
Date:   Tue Feb 19 21:21:08 2013 +0400

    Issue #458

[33mcommit cbf50bf37699b9955bb1c4c1d5e9b716a5063d1a[m
Author: Luxor <atuzov@gmail.com>
Date:   Fri Feb 15 23:00:51 2013 +0400

    Issue #458

[33mcommit bcd3c148a80436805e9ea929106192c9364e8159[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Jan 30 08:23:53 2013 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 9b51b123e5ab00ce5c1bf8e8391509827e37501d[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Jan 30 08:23:43 2013 +0000

    [maven-release-plugin] prepare release v1.1.2

[33mcommit cb6951238f10fd94e39792d54b1568e4ca3faeb0[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 25 21:25:05 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 9a118b892a972acf611131799bc6dcf3ea0a5e4c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 25 21:24:54 2012 +0100

    [maven-release-plugin] prepare release v1.1.1

[33mcommit 8a1ffdea017965c65b685123bcf320c24a5fcc98[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 25 20:12:05 2012 +0100

    Moved the JUnit package and configured API docs

[33mcommit 438b8cacd4662fa70f99907e586eb497a8bcfa5e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 25 02:46:53 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 46f8decbf170ab433ff1904467003aa480f35f97[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 25 02:46:45 2012 +0100

    [maven-release-plugin] prepare release v1.1.0

[33mcommit 09aac5bb6ee9af84906df27b689080740f81acc2[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 25 02:37:01 2012 +0100

    Changed public Groovy API to cucumber.api.groovy. Fixed some docs.

[33mcommit bdb5a5e6937c477caedbf32f16169bbd02f081d7[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 25 02:11:24 2012 +0100

    Some last minute fixes before the 1.1.0 release.

[33mcommit 87850b03c449f027011aedbfd5cc2930f046a68c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Oct 13 19:07:20 2012 +0100

    Improved Transformer API

[33mcommit 0ef2a199a087d753512bb1445ef69836047f76e6[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 11 01:21:20 2012 +0100

    Big package reorganisation. This is needed to make it more obvious what's part of the public API and what is not.

[33mcommit 27284826bb561142201cd88abd98c0a93880788b[m
Author: Martin Hauner <martin.hauner@gmx.net>
Date:   Sun Oct 7 15:02:29 2012 +0200

    simplified backslash escaping

[33mcommit 9f7b201d81790a0b79386167e7257fa1d0ae837c[m
Author: Martin Hauner <martin.hauner@gmx.net>
Date:   Sat Oct 6 19:38:26 2012 +0200

    fix cucumber-jvm #391

[33mcommit 50f8682705ffe3679c984361b203bc9513ab177c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Oct 4 22:48:14 2012 +0100

    Normalized groovy and scala generated code as well

[33mcommit 17aae23b5b218a491e98ad5d73eae7f6f9839052[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Aug 20 16:06:16 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit ffc924c244101fbfd213eaf65653884b70b65234[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Aug 20 16:06:08 2012 +0100

    [maven-release-plugin] prepare release v1.0.14

[33mcommit ab5acca7969cfb13ab5345aada6224cde4e1c36e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Aug 20 14:56:33 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit b3739826c241fb30c49fef3383dc69f6a7de8e9c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Aug 20 14:56:25 2012 +0100

    [maven-release-plugin] prepare release v1.0.13

[33mcommit 25fcc49e07c0f11cf942216766bc9d01f7c37f5e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Aug 20 14:36:32 2012 +0100

    Release 1.0.13 with better packaging

[33mcommit a58b5d44ce1ef1b0b83d917b742f0a97277f1282[m
Author: Konrad Paumann <konrad.paumann@gmail.com>
Date:   Mon Aug 20 10:29:06 2012 +0200

    increase version to prepare for next development iteration:

[33mcommit 6e7927cc9a0aa71701a7455ff7980dab54f8b3e6[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Aug 19 19:34:49 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 18d40038f83f96b18b80b7c89fdcaf3070a29620[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Aug 19 19:34:40 2012 +0100

    [maven-release-plugin] prepare release v1.0.12

[33mcommit d85e1451420500ee493aa033ab26d0ee9b05805e[m
Merge: b166240 45b08a0
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Aug 18 20:33:01 2012 +0100

    Merge branch 'master' of https://github.com/marquiswang/cucumber-jvm into marquiswang-master

[33mcommit b166240f6e0d48f446578699736745f9fc8a8f5c[m
Merge: 007f880 178d1b2
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Aug 18 12:28:07 2012 -0700

    Merge pull request #374 from bezda/master
    
    Run Before/After methods from env.groovy first

[33mcommit 007f880a234ced97c7aea1e9afea6d5923eeb426[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Aug 18 10:40:37 2012 +0100

    Bump gherkin (which bundles new gherkin-jvm-deps jar) and use new cucumber-jvm-deps jar which is also a separate project. This should simplify build quite a lot

[33mcommit 178d1b27dd6eb65d5c08314c8d6bc0f1a16c451a[m
Author: Tomas Bezdek <tomas.bezdek@f1000.com>
Date:   Tue Aug 14 12:58:24 2012 +0100

    cuke4duke convention is to run env.groovy Before/After methods first/last

[33mcommit 45b08a03df47a37ebc00af32c251e6e6d4912ca8[m
Author: Marquis Wang <Marquis.Wang@imc-chicago.com>
Date:   Tue Aug 7 09:51:25 2012 -0500

    Add support for List step definition parameters

[33mcommit b9368ea7a45733b8fa8503acc7bdbe2caeefe18a[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jul 6 11:26:27 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 38b5d337b12a2394e3ec0d197842831577f67e8b[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jul 6 11:26:21 2012 +0100

    [maven-release-plugin] prepare release v1.0.11

[33mcommit 806cfc29f52738b77c44cfccfe13714fbe7cbb68[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jul 6 11:21:51 2012 +0100

    Undo bad changes I mkade in bbe40d3d451703f41ef36d16415144268d6ff72a while fixing #356

[33mcommit 453fb779c2358e35846f675bd20bc6a516754290[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jul 6 11:18:12 2012 +0100

    Fix tests that broke in #356

[33mcommit 5cd4c94bd0a20144e003db60a862cd65f54c803f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jul 6 09:28:29 2012 +0100

    Tweak poms so they work in IDEA as well

[33mcommit 82f08b092e54fe156df547251d9a56eeeb9307af[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jul 6 08:31:14 2012 +0100

    Maven fun

[33mcommit 7b09379a1138f5fd3a960514498b5276db82f8ce[m
Merge: e427187 02b0a5a
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jul 5 13:11:25 2012 +0100

    Merge

[33mcommit 02b0a5aab675f714792b567f3c333f40cef68a5f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jun 29 14:43:13 2012 +0100

    Cleaning up poms

[33mcommit c91e5b1d7bdae5865fb9b88a31367d2b94f9452b[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jun 29 08:49:45 2012 +0100

    Build passes with cucumber-deps

[33mcommit e1e6dd3cac745204eb47bea8e330a0815340fa85[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jun 29 07:43:42 2012 +0100

    Pass a SingleValueConverter to ParameterType

[33mcommit e427187db237a81ed4141c1d24d9da3642a9607e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jun 29 14:43:13 2012 +0100

    Cleaning up poms

[33mcommit 0c9da29db910aafcebeb70d6d0acfbecc2f8a84e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jun 29 08:49:45 2012 +0100

    Build passes with cucumber-deps

[33mcommit 9841720fa834cb7abf09a245c91478b8d02fa872[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jun 29 07:43:42 2012 +0100

    Pass a SingleValueConverter to ParameterType

[33mcommit 8f3f98b46b423d41e72e5ae97dda3005728e7237[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Jun 20 16:35:33 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 58682e0fa5c0b6a140c401c7a0240153aff1cdae[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Jun 20 16:35:28 2012 +0100

    [maven-release-plugin] prepare release v1.0.10

[33mcommit ad5fa846786ef7b3e7bcedbbd351f840fc04987a[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Jun 20 11:18:32 2012 +0100

    Refactored the StepDefinition interface so that backends for dynamic languages can infer the type of a parameter based on the actual argument type passed to it.

[33mcommit 3312f3811b12264d25d5c8739cd910ead950ac71[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Jun 20 07:51:16 2012 +0100

    Big refactoring in table conversion land

[33mcommit 5a908656889c5ae86f1abe7d4d28c087fd405b9f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jun 18 16:15:15 2012 +0100

    Step definitions and hooks can now specify a timeout (milliseconds) after which a  is thrown if the stepdef/hook has not completed. Closes #343

[33mcommit dd5507fe5138343a64c098645d5f32442a7a905d[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jun 8 15:33:44 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit fa59bb9a8987f298356592c4ae7cd880552a8311[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jun 8 15:33:39 2012 +0100

    [maven-release-plugin] prepare release v1.0.9

[33mcommit 895dd6e225bd1db11ace9b6b654a17c4b092d1b1[m
Merge: 1a978ff f94d0e6
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jun 8 07:56:34 2012 +0100

    Merge with master. This should fix #133.

[33mcommit 1a978ffbfb1aa1b312f95ce7e6f4799488b18b33[m
Author: DFUK <SELondon@drwuk.com>
Date:   Thu May 17 12:51:01 2012 +0100

    Changes to work with gherkin's hook-reporting branch

[33mcommit f94d0e6fad2e5fbeeb5cd576ab129ac9656f1f46[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 17 11:39:45 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 31f15021bbf085e73204b527c5b5a7658d460e2f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 17 11:39:40 2012 +0100

    [maven-release-plugin] prepare release v1.0.8

[33mcommit 6161510e1d91e5db3f3ffc23b386d7cfa549ad24[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 10 08:25:59 2012 -0500

    [maven-release-plugin] prepare for next development iteration

[33mcommit 38fb54eb3731dcc6077a9c065266b85daf0c4dae[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 10 08:25:54 2012 -0500

    [maven-release-plugin] prepare release v1.0.7

[33mcommit 6560d5c1e120b34bcf80c779fe16892c27f9f174[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon May 7 17:56:42 2012 -0500

    Throw an exception if a glue or feature path doesn't exist (i.e. neither file nor directory)

[33mcommit b08e6b859b122f3efa04b4fa13bff1ba17fceaa0[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 3 16:58:59 2012 -0500

    [maven-release-plugin] prepare for next development iteration

[33mcommit c0ff14a7d04d1dc9bbd881e0252795e71c2df2f0[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 3 16:58:56 2012 -0500

    [maven-release-plugin] prepare release v1.0.6

[33mcommit a7753a2f26ca8a3e117ddb3f58340c69c359e892[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 3 15:38:35 2012 -0500

    [maven-release-plugin] prepare for next development iteration

[33mcommit 2120fde2e337f44c6f5f904f87acf1c2683fe9d5[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 3 15:38:32 2012 -0500

    [maven-release-plugin] prepare release v1.0.5

[33mcommit c9c655e43de2d55be176bc1422268de8390c2657[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 3 15:29:35 2012 -0500

    Reformat code. It really gets out of whack when people contribute with all sorts of different IDE settings.

[33mcommit ebcb017d65e5d965a9c8cbf24a64f39798436022[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu May 3 15:22:58 2012 -0500

    Fix several problems with resource loading for scripting languages (after the new classpath: scheme was introduced)

[33mcommit 754278cfb0190ac380eb8aa4de0ce3ec03a1cd3a[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue May 1 15:19:47 2012 -0400

    Added cobertura code coverage and started to clean up some cruftiness in the io package

[33mcommit 8343586419113fdb2f63a311019947958106a449[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Apr 23 23:53:04 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit a7363799f434b6ae01ab4f794cee7a20204e9d2d[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Apr 23 23:52:55 2012 +0100

    [maven-release-plugin] prepare release v1.0.4

[33mcommit 39f5c4f4e0366064af4831823f40cf83c9d29eaa[m
Author: Martin Hauner <martin.hauner@gmx.net>
Date:   Sat Apr 21 12:06:38 2012 +0200

    fixed & simplified groovy step snippets

[33mcommit 90c1a59d956b6e88c20b6aef0366dc3cfb5eaaf1[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Apr 19 16:23:08 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 04f2d939067b3a536fe30d0a41571953622990b4[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Apr 19 16:23:02 2012 +0100

    [maven-release-plugin] prepare release v1.0.3

[33mcommit 303e75baad23e93e7e31ec4974318f9144b63967[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Apr 17 22:37:27 2012 +0100

    Fixed some regressions to glue code introduced in 1.0.2. Might fix issue #299, but that's not confirmed.

[33mcommit 37ba07b14e5bb39a0f51778d23b10abfd683f698[m
Merge: 1f29f5f 8674060
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Apr 17 21:19:19 2012 +0100

    Merge with master

[33mcommit 1f29f5fc98afa4d64c33df76b688a6bd4fd21d68[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Apr 17 20:49:15 2012 +0100

    Show code source for Java step definitions in case of duplicates or ambiguous stepdefs.

[33mcommit 86740607304ecd77b3b5dabaf25c7eea7c90c25e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Apr 12 16:29:10 2012 +0100

    Workaround for arity mismatch on Groovy. Need an explicitly empty list of closure parameters. Closes #297.

[33mcommit a6c1e2da26cd826790beb933f5f922ccc118557c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Apr 11 11:22:25 2012 +0100

    Added an example of how to convert a DataTable to a List of Thing in Groovy

[33mcommit c9e37703256424e6ec70c8acf720a10d7d4fc04a[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Apr 3 21:32:28 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit d17922e812505211e1a69378ea461b257854dba0[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Apr 3 21:32:22 2012 +0100

    [maven-release-plugin] prepare release v1.0.2

[33mcommit 4c86b044811a8514f419f8629cde1a33d193ff15[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Mar 30 10:28:11 2012 +0100

    Moved java file from groovy to java

[33mcommit 6b73490a6067cbb7528020495cc51beea69195e4[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Mar 29 14:58:24 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 3961200a45ec91a819f3638aee1dc301798c70d3[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Mar 29 14:58:18 2012 +0100

    [maven-release-plugin] prepare release v1.0.1

[33mcommit dd457b55724ef27e918258cd0fb08ef602f9c72b[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 27 00:36:30 2012 +0100

    [maven-release-plugin] prepare for next development iteration

[33mcommit 8773806d8ed9c174244acaa7e0992d79846c44ff[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 27 00:36:18 2012 +0100

    [maven-release-plugin] prepare release v1.0.0

[33mcommit 5e88d2cf401063a639c86a708bb8dce6694a8abe[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 27 00:30:22 2012 +0100

          oe               .n~~%x.                .n~~%x.
        .@88             x88X   888.            x88X   888.
    ==*88888            X888X   8888L          X888X   8888L
       88888           X8888X   88888         X8888X   88888
       88888           88888X   88888X        88888X   88888X
       88888           88888X   88888X        88888X   88888X
       88888           88888X   88888f        88888X   88888f
       88888       .   48888X   88888     .   48888X   88888
       88888     .@8c   ?888X   8888"   .@8c   ?888X   8888"
       88888    '%888"   "88X   88*`   '%888"   "88X   88*`
    '**%%%%%%**   ^*       ^"==="`       ^*       ^"==="`

[33mcommit 7a9e3a284417dbf17328d7da5c16dd3978656877[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Mar 22 17:57:54 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 135e6d6f299e13572471f275b5deace8e55be037[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Mar 22 17:57:47 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC24

[33mcommit 6516b1637bfe7c18a1d7435482985dc599bba7cd[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Mar 22 07:17:47 2012 +0000

    Update all snippets to throw PendingException, following up on #271. Need to make Clojure do this.

[33mcommit a634e495a3972a1811df054c124b3a312372af97[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 20 16:56:15 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit b006e8941f324e5657cc7930916f27c52f9b60a2[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 20 16:56:08 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC23

[33mcommit 0eb28eb618f3704fa3948741d17c4ea1609f55e3[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 20 11:02:56 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit ca7f550031de839675896c014882d91e7fd2ae03[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 20 11:02:51 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC22

[33mcommit bdd865767bc7d18856c72aa8b4164c39b432519a[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 20 10:16:01 2012 +0000

    Snippets for DataTable include a hint about using List<YourType>, so people discover this neat technique

[33mcommit 7724e212677531fa09a487e6315db811f639efb1[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Mar 20 10:01:39 2012 +0000

    Support DocString and DataTable in generated snippets. Closes #227

[33mcommit 48e154945dbe0d58f1ac7dc70ff99395bd37ebae[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Mar 18 10:32:47 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 202a25b63ad984b7e1fcb06ea32417851c56cba6[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Mar 18 10:32:41 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC21

[33mcommit cc3dec984f5f87c6ecf40825c1f2372e81d37566[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Mar 17 14:25:12 2012 +0000

    UTF-8 everywhere. Closes #251

[33mcommit 012bf72a7d51d5b953c3aac680d7747ed5270174[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 18:06:31 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 3a31aa7f82decc80074c2f634bd841f33dde005b[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 18:06:26 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC20

[33mcommit 35783c39f5cc311de67c6559a3f0d2cb13d8dca1[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 18:04:19 2012 +0000

    Go away warning

[33mcommit 6cd0301e7c2251ad79fdb75c05fa95a17e4c39c1[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 17:31:34 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 9e7fe7418f04500da62c6f54ee0dcb3678885af0[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 17:31:29 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC19

[33mcommit 6173a4bbbbf8649f77b094a023871a71104ea705[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 17:28:52 2012 +0000

    Try release one more time

[33mcommit b0cf9f9902fd213e42348e64997a93764173e19f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 16:16:56 2012 +0000

    Let's try that release again

[33mcommit a8e2e583243937623cb4a397509b1929fe6d983f[m
Merge: c059dcf a7c78f1
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 12:40:33 2012 +0000

    Merge branch 'master' into hauner-groovy-cli

[33mcommit c059dcfbdc748dbbbeb6293ea01e52b8de1abc86[m
Merge: 252d3ea d1ec502
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 12:39:10 2012 +0000

    Merge branch 'groovy-cli' of https://github.com/hauner/cucumber-jvm into hauner-groovy-cli

[33mcommit a7c78f1865716bfda13b829438b036e54aaf546d[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 12:38:49 2012 +0000

    Removed console out

[33mcommit 252d3eac99228c1eb823a72907912a4729a2037b[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 29 11:09:43 2012 +0000

    Optimize imports, format code

[33mcommit d1ec502f6218d6e6cc1f63118334d77967326872[m
Author: Martin Hauner <martin.hauner@gmx.net>
Date:   Sat Feb 25 16:37:41 2012 +0100

    added dot-based glue path example

[33mcommit d0f9e785d6095ac61431e1fa1022ceedf71f4728[m
Author: Martin Hauner <martin.hauner@gmx.net>
Date:   Sat Feb 25 16:31:31 2012 +0100

    added missing parameters to cli test command line

[33mcommit 9fdfc69cacfedc3783a9cd3a75f06f03acff0a28[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Feb 20 18:30:09 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit df98a9f196de96ae91637acf83710dab96525a16[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Feb 20 18:30:00 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC16

[33mcommit 899256d847edd4cba84a20feec6ad76247dbfae7[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Feb 19 21:46:11 2012 +0000

    Fix tagged hooks for scenario outlines. Closes #209, closes #210

[33mcommit f1f0df340e7ac06dd14b47af74349163af9766c8[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Feb 17 20:08:21 2012 +0000

    Ambiguous step definitions don't cause Cucumber to blow up, they just fail the step. Fixed #206, but broke the native groovy CLI runner, which I had to disable - see #212

[33mcommit f27bd75a707f911bca638803beb283532bb78cd2[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 15 00:29:24 2012 +0000

    Use a mix of compiled and interpreted stepdefs

[33mcommit d35a7aceab9a918b6a9f621e4e195dc30f353039[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Feb 15 00:18:29 2012 +0000

    Compiled Groovy stepdef scripts are found as well as source ones

[33mcommit 3217431b89daa082b7a1b97a5a9af2bc52984294[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Feb 7 01:09:11 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit ac143cbd224cd22010196938bea9c6ef7eefff15[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Feb 7 01:09:02 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC15

[33mcommit ec048035953f4d4731b2f3f103f8ba8b17a67e2b[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Feb 6 00:36:34 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit ebfc15e86bccaf29eb85ecd84509aaaa8702e7bb[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Feb 6 00:36:25 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC14

[33mcommit 375f10f4c168e4bc1ac6782cff559154c2b68d59[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Feb 5 17:42:22 2012 +0000

    Use I18n instead of Locale since converting from Locale to I18n is tricky.

[33mcommit 68e8c95f4807c0dfd97130e597bf90e4116cc8fa[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jan 26 08:23:59 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 133bc5d73198f1aea951c7058dc2eca0bf534427[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jan 26 08:23:49 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC13

[33mcommit 5f1c958eb05131bf831eb3d9a3ceb23abc48e46a[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jan 23 16:16:08 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 4e92f039e204b1dec4e1289036146f98924fa841[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jan 23 16:16:01 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC12

[33mcommit dafc0a5b7f3124b29611ce8b6d106c327c555e03[m
Author: DFUK <SELondon@drwuk.com>
Date:   Mon Jan 23 08:44:45 2012 +0000

    Fix Scala build. Closes #167.

[33mcommit 6cd4d972c320a320f26a564286585532dc6a71b9[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Jan 22 22:25:29 2012 +0000

    Remove obsolete .gitignore files - sources are generated under the target folder. Closes #157.

[33mcommit 26be4dc27f5d76b82c4ebb00fe02599cf7c764d9[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 21 23:29:55 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 6d6a740183d369b356e36b558fe746f618999222[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 21 23:29:47 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC11

[33mcommit 3aa262d752d1ec120aade7b13b14623231a46f8c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 21 23:09:31 2012 +0000

    I think this fixes build problems on Windows.

[33mcommit 7b60bec97500b7e998ac1dfb56d0fa9565e659d7[m
Merge: ec6e80b 91936c3
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 21 22:45:09 2012 +0000

    Merged scala changes, but had to revert / to " - sorry @dwskoog

[33mcommit 91936c385937e72358b33b6fb4798bec226b8ec8[m
Author: David Skoog <dwskoog@gmail.com>
Date:   Sat Jan 21 15:23:24 2012 -0500

    Make POMs Windows-happy
    
    When ${baseDir} gets interpolated on Windows the traditional double-quote
    delimiters make for a malformed String literal.

[33mcommit ec6e80b700f1ace3c18a659d23030b4a55b9a7ea[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 21 17:38:49 2012 +0000

    Fix Windows build problems mentioned in #154. Add History entries.

[33mcommit d4844254df41df069480bdd5e6c53428e871766c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 21 00:28:28 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 90b038dc74bc2a97fa116cf2c93edee7a515c849[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 21 00:28:20 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC10

[33mcommit 86c2e0e4ebe05d404ba689f3d5fbfa878581052f[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 20 23:48:08 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 61b7c49e6257216f1b861dbbcbdc0cad28f942f5[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 20 23:48:01 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC9

[33mcommit cf3f77ac29c34ac902920396bc1bcf58bddd06dc[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 20 23:28:35 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 4f14afa5b8ea304fb88d9ba9356e8d1fdd7f8c47[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 20 23:28:28 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC8

[33mcommit 34d9728fae5eebe131e3e5411bdc274a738c60d7[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 20 23:18:56 2012 +0000

    Clean up groovy full jar

[33mcommit fc2df32bbcdaabd4aa2acecd53986f2cde145b37[m
Author: David Kowis <david.kowis@rackspace.com>
Date:   Fri Jan 20 16:15:04 2012 -0600

    Fix the version number appropriately

[33mcommit 83703c303bd23ad8fd43e35d43830a1663b6f10e[m
Author: Aslak Hellesoy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 20 17:10:48 2012 +0000

    Renames

[33mcommit 219a57e2830039158bdbe450652476a5dce42c36[m
Author: Aslak Hellesoy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 20 14:01:09 2012 +0000

    Run Groovy CLI tests

[33mcommit 80515c949002b686586168911e7e5b37742ecc38[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jan 19 22:51:49 2012 +0000

    [maven-release-plugin] prepare for next development iteration

[33mcommit 6582e4265168c4b9c31f9b0560f00bfd0ddfbeec[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jan 19 22:51:41 2012 +0000

    [maven-release-plugin] prepare release v1.0.0.RC7

[33mcommit 418b775b0f8a16349eb31bf5c84e716981075123[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jan 19 22:35:52 2012 +0000

    Update version

[33mcommit 452913aa3874acfdad9b7deb2d85641d24ad5081[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jan 19 22:33:14 2012 +0000

    Remove ant files

[33mcommit abdae2207b197510ad3d74950a786d722fd78761[m
Merge: f1ec9ec 2fff669
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jan 19 21:56:49 2012 +0000

    Merge branch 'dkowis-maven_resurrection' into dkowis-integration

[33mcommit f1ec9ecd4d9bf41fbd9e9529ab3185fcafbe92fa[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jan 19 21:54:34 2012 +0000

    Remove stuff that we don't need

[33mcommit 1bbccfabde3bc520fe5dadde536c3cab132cdef1[m
Author: David Kowis <david.kowis@rackspace.com>
Date:   Wed Jan 18 16:43:12 2012 -0600

    Created an UnreportedStepExecutor interface
    
    I don't like that this current implementation passes the Runtime into the backends
    It shouldn't. So I used the interface, so hopefully at some point, refactoring in the
    future won't suck.
    
    It passes all unit tests.

[33mcommit 2af267554a2d7dc12f7b215de89355b3e56b5037[m
Author: David Kowis <david.kowis@rackspace.com>
Date:   Wed Jan 18 10:31:25 2012 -0600

    rename world to glue

[33mcommit 164b550d5e87831ea8f3997f81c4faefcd14280c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Jan 18 08:30:33 2012 +0000

    Removed OneTimeResourceLoader and made sure glue code is loaded only once. The Backend.loadGlue method should ideally be removed, and the World and gluePaths passed to each Backend's constructor. Other TODOs on this branch: rename World to Glue. RuntimeGlue should not have a ref back to Runtime. Make Scala work again (disabled it because I don't have the required Scala fu)

[33mcommit 2fff669835b875f5d95ec8c44d08734f3d5e34c6[m
Author: David Kowis <david.kowis@rackspace.com>
Date:   Tue Jan 17 14:44:02 2012 -0600

    Groovy files are appropriately generated and added to the sources

[33mcommit b684072236ab48fb77917f071d3f045bf427d595[m
Author: David Kowis <david.kowis@rackspace.com>
Date:   Tue Jan 17 13:46:05 2012 -0600

    Set project version correctly

[33mcommit ef9f88348a6743dee88aaa3dcdf5155653977251[m
Author: David Kowis <david.kowis@rackspace.com>
Date:   Tue Jan 17 13:39:05 2012 -0600

    Re-adding the poms from before the ant/ivy stuff

[33mcommit 94af09e44f44f69f290adbbe43b88c404cb326af[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jan 17 13:58:49 2012 +0000

    Dual build

[33mcommit 3436981f5f10820f3a60e722d5f9b47a91d7ec81[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jan 17 12:57:36 2012 +0000

    Added back poms - they are generated from ivy.xml (except the parent pom)

[33mcommit ac59adf47a03558167825e8ce7140884807fda39[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jan 17 07:23:00 2012 +0000

    Fix jar refs

[33mcommit 777c1757dc9363a34280e404a2c7446a53e7e818[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jan 16 23:32:33 2012 +0000

    Fixes #143

[33mcommit b3a02f7c9d67c6d2f47e37c847335efce7db83b0[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jan 16 07:51:32 2012 +0000

    Release 1.0.0.RC4

[33mcommit 8611ad136a52d566dea97baf2904196cd27a9e65[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Jan 15 17:20:21 2012 +0000

    Removed obsolete files

[33mcommit 7d160d9bb43eb815cf345fa1daea1eeae52444a4[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Jan 15 16:45:13 2012 +0000

    Added IDEA project files

[33mcommit 6ec5ef4c11532aa75d8997cd0c54413691ed219d[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Jan 15 00:08:43 2012 +0000

    Fix build

[33mcommit 08dee8aaa50fefe78ffd0732f0c59a1b02ee5443[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 14 23:24:40 2012 +0000

    Looks like we can release

[33mcommit d33a497407696ca3a7d58f25782985e1c0cdc1ec[m
Merge: 76c68a7 9b19b46
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 14 18:13:39 2012 +0000

    Merge with master

[33mcommit 9b19b4621e9c8e4a8ddb1b84cc4d981c98c5e4a2[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Jan 14 18:11:35 2012 +0000

    Replace inheritance with delegation for #138

[33mcommit 76c68a7421f5fa062ae947f08337fbf5ebd22dd5[m
Author: DFUK <SELondon@drwuk.com>
Date:   Fri Jan 13 16:08:12 2012 +0000

    All builds, except for openejb (need to set up that repo)

[33mcommit 33f02b3ade0d7fd14535b86ad8356859ea803dea[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 13 07:25:56 2012 +0000

    Publish all modules

[33mcommit b8c065f145504cfdfa43358ea83161f7d755cae7[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Jan 12 23:05:57 2012 +0000

    Finally getting there with Ivy

[33mcommit b0445e581067a7d631bb9c2ad8ae335443c04a5f[m
Merge: f6a5473 327f7e3
Author: DFUK <SELondon@drwuk.com>
Date:   Thu Jan 12 09:29:29 2012 +0000

    Merge with master

[33mcommit 327f7e372736ce96a359344734c5b32b46c7ecd5[m
Merge: 1b67c35 a994140
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Jan 11 21:40:52 2012 +0000

    Merge branch 'call_steps' of https://github.com/dkowis/cucumber-jvm into dkowis-call_steps

[33mcommit a99414053c4b363dec117cec619c6990e8908207[m
Merge: da0b36b 365f7b0
Author: David Kowis <david.kowis@rackspace.com>
Date:   Tue Jan 10 17:30:15 2012 -0600

    Merge branch 'master' into call_steps
    
    Changes were needed to merge everything in.
    All tests pass and everything works
    
    Conflicts:
            core/src/main/java/cucumber/runtime/World.java
            jruby/src/main/java/cucumber/runtime/jruby/JRubyBackend.java
            jruby/src/test/resources/cucumber/runtime/jruby/test/cukes.feature
            jruby/src/test/resources/cucumber/runtime/jruby/test/stepdefs.rb

[33mcommit 1b67c35f2092d736a9fac865c2e6106b32f79066[m
Author: Martin Hauner <martin.hauner@gmx.net>
Date:   Sat Jan 7 10:25:39 2012 +0100

    added constructor with additional GroovyShell parameter

[33mcommit da0b36bb6471cc8ee73cf40a6d39e62e338d7720[m
Author: David Kowis <david.kowis@rackspace.com>
Date:   Fri Jan 6 15:20:38 2012 -0600

    Refactoring out the Reporter from the step call
    
    Created a new method, runUnreportedStep, that simply grabs the step out of a match,
    throwing an exception if it does not match, and executes it.
    
    All the exceptions are required to trickle up so that they're caught by the step that
    does the actual execution so that things look right in the output.
    
    A snippit will be generated if you call a non existing step, so that's handy :)

[33mcommit f6a547304ddc30b15f1b9842e63e74ec1c4828ed[m
Merge: bf8f9a0 365f7b0
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 6 00:12:26 2012 +0000

    Merge branch 'master' into ivy

[33mcommit 365f7b0bd06b821efc0927c090f2b9e5e654c8de[m
Merge: d832597 038908d
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Jan 6 00:10:35 2012 +0000

    Merge branch 'groovy-stepDefLocation' of https://github.com/hauner/cucumber-jvm into hauner-groovy-stepDefLocation

[33mcommit bf8f9a00a2ce95d6551535c1a574db21ffc50c2b[m
Author: DFUK <SELondon@drwuk.com>
Date:   Thu Jan 5 18:43:14 2012 +0000

    Fix code generation

[33mcommit 08f76961c4fafebcdb5de7fbd098257382e236b9[m
Author: DFUK <SELondon@drwuk.com>
Date:   Thu Jan 5 18:26:33 2012 +0000

    Delete all generated files. We generate them in the build now.

[33mcommit e4d473ef92490a04da31f0b688b64ee045006401[m
Author: DFUK <SELondon@drwuk.com>
Date:   Thu Jan 5 17:05:35 2012 +0000

    Ant based code gen for groovy. Fixed cli-test for jruby and groovy

[33mcommit 1def655886b17d1501c111b50b34c9e3b4fcdc54[m
Author: DFUK <SELondon@drwuk.com>
Date:   Thu Jan 5 13:29:32 2012 +0000

    Don't come back maven

[33mcommit b48e51ffcf60d25d9263a3c79c7dcbe8fa654ce2[m
Author: DFUK <SELondon@drwuk.com>
Date:   Thu Jan 5 13:27:11 2012 +0000

    Ivy builds all the way through. Thanks for helping out @tastapod

[33mcommit 038908dd11b87b639f337e52035963cc3df11918[m
Author: Martin Hauner <martin.hauner@gmx.net>
Date:   Thu Jan 5 13:46:19 2012 +0100

    handle StackTraceElement with empty file name

[33mcommit 624e8cb81a06383099355eb9e12c67db711e2663[m
Author: Dan North <dan@dannorth.net>
Date:   Thu Jan 5 11:06:34 2012 +0000

    Starting to drop in ${cucumber-jvm-version} into ivy.xml files. Dev checkpoint

[33mcommit eaf068b5e27713d890ab0db317f24cd58ff780a4[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Jan 4 20:07:39 2012 +0000

    Added tasks for standalone cli running with groovy and jruby

[33mcommit eae95514836c40292e3e1d8c5946fc58c9c45a6a[m
Author: David Kowis <david.kowis@rackspace.com>
Date:   Tue Jan 3 15:16:25 2012 -0600

    Revert "Bring the URI forward to the step evaluation too."
    
    This reverts commit 1851bfe0c56c8abd223ad25a57988c76d0c66396.

[33mcommit f1011a342c612497bbc58534fbaff1b210ad515c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Jan 3 18:28:34 2012 +0000

    Added openejb

[33mcommit d7186e4f9dd4897d726830ee37e05a6713fdc593[m
Author: David Kowis <dkowis@shlrm.org>
Date:   Mon Jan 2 16:37:46 2012 -0600

    Bring the URI forward to the step evaluation too.
    
    This doesn't smell right, there must be something I'm doing entirely wrong.

[33mcommit cd0fd4225121b5d6f5c49d000587af089d1385af[m
Author: David Kowis <dkowis@shlrm.org>
Date:   Mon Jan 2 15:50:02 2012 -0600

    Refactor to change the execut method to include Reporter and Locale

[33mcommit 12434a59ae29cac60a56dc8f7432cf894a76040e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jan 2 17:03:44 2012 +0000

    More ivy

[33mcommit d832597f12c71045d2f1fa57b53c28f8f32b10c1[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jan 2 11:21:13 2012 +0000

    Reenabled Scala

[33mcommit 808dbee154178b0ef7727371d16b3c9fcffaf911[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jan 2 10:40:08 2012 +0000

    Upgrade deps, improve snippets.

[33mcommit 3a1b5787772a74b8bbbbc5ecfaa5f3892c0a1f7c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jan 2 09:10:37 2012 +0000

    Added standalone script for Groovy

[33mcommit 94e025cd0b2e0a7e2c1f9f53b30fa79f115e37f6[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jan 2 08:30:30 2012 +0000

    Load resoureces from classpath when using JUnit, load them from filesystem when using CLI

[33mcommit 76fea23bb49e156d06ae8fafe8a2a64024fcc149[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Jan 1 23:55:48 2012 +0000

    All tests passing, ut still not good

[33mcommit 7436d97c3c7f89d52cb6700466dd02c6261f7206[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Jan 1 23:44:43 2012 +0000

    Rewrote a lot of the resource loading code

[33mcommit c9c364ce98783ece1b9969b4478c635e61efcfa8[m
Author: Martin Hauner <martin.hauner@gmx.net>
Date:   Wed Dec 7 23:24:44 2011 +0100

    backend should add after hook as after hook and not as before hook

[33mcommit 5c4997fbd2ff6eb38e88ac7f7600e699b6efb2cc[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Dec 6 10:33:18 2011 +1000

    Extract method for clarity

[33mcommit 55c91b217985375157abf9b024215f33d1b96309[m
Merge: 06fa81f 87bae81
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Dec 6 10:23:54 2011 +1000

    Merge branch 'groovy-script-only' of https://github.com/jterhune/cucumber-jvm into jterhune-groovy-script-only

[33mcommit 06fa81f83dcda6e6c5c5e9818c00e38df1aa7621[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Dec 6 10:15:32 2011 +1000

    Maven hosed the previous release attempt.

[33mcommit 87bae81e4fe5941d6d23db59b3acf394685f6c50[m
Author: Jason Terhune <jterhune@redbrickhealth.com>
Date:   Mon Dec 5 10:39:59 2011 -0600

    Updated groovy tests so they pass in maven build

[33mcommit cf5545736028e3b412fb1e2da166647bc1cfd9ce[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Dec 4 11:42:28 2011 +1100

    [maven-release-plugin] prepare for next development iteration

[33mcommit c8454e163647a0ecf71d6dccdc648b57f87840d1[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Dec 4 11:41:57 2011 +1100

    [maven-release-plugin] prepare release v1.0.0.RC1

[33mcommit 9f05f0894c024002dadeb2574ce0bab51e9f7679[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Dec 4 11:31:19 2011 +1100

    Let's try to make a release

[33mcommit acf72509f035803085334e5a0a4cb82b7dcb805d[m
Author: Jason Terhune <jterhune@redbrickhealth.com>
Date:   Fri Dec 2 11:22:20 2011 -0600

    Prevent exceptions when trying to run groovy files that are classes

[33mcommit 2241becb4a77b3b82df5da40c05d68e771758ca4[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Nov 11 17:38:07 2011 +0000

    Tagged (scoped) step definitions are reverted. Bad idea.

[33mcommit 662916af8403387dce977741ef26f4cffce928c8[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Nov 10 13:00:24 2011 +0000

    Step Deinitions can be scoped by tag (just like hooks). Currently only implemented for Java.

[33mcommit 0bb7d2338710620ff7e987f5550b4898660105dd[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Nov 7 13:56:46 2011 +0000

    Fixed some Groovy bugs

[33mcommit e65b8c1c85aaf5ecd7878be6e609f0f7bfd6ecbb[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Oct 25 23:00:48 2011 +0100

    Date format can be specified with a @DateFormat annotation

[33mcommit c8d4cc57cde5c93c3b6f1d752affa73f462676e7[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Oct 25 22:29:51 2011 +0100

    Refactoring to capture more info about types

[33mcommit c9be367125722e95f5da0b3cfb3e0f36cb181f87[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Oct 19 23:55:24 2011 +0100

    gluePath is the best name I have come up with for 'class path or script path where stepdefs and hooks live'

[33mcommit 5210aef5844055557801ab0a4b0fed95ccbaf8d5[m
Author: Martin Mauch <mauch@crealytics.de>
Date:   Wed Sep 28 17:01:40 2011 +0200

    Fix broken conversion of table to List<Map<String,String>>. Addresses @nightscape's comment in #49.

[33mcommit dc6c70eeb27245eac915deb73f6f54d7facb5550[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Oct 18 22:34:04 2011 +0100

    Update i18n

[33mcommit 9e648b9aaca1713d17d50fda957a05f33ab2a7fb[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Oct 17 20:48:05 2011 +0100

    Added a progress formatter and made it the default. New iml files that get updated more easily.

[33mcommit 876055c13bca748656d3746387fd580743181806[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Oct 16 16:30:15 2011 +0100

    merge

[33mcommit 250819fd172b3880b2692dcf095debe1f679c029[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Oct 14 22:41:04 2011 +0100

    Scenario Outlines and Background are roughly working

[33mcommit 5164b25f5a4a3db82af7afda789ffe4b993b60ca[m
Merge: 721bb3e e016525
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Sep 25 08:01:48 2011 +0100

    Merge with master

[33mcommit e016525395578e8a4283fdfb5cb3861809a88175[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Sep 24 12:09:48 2011 +0100

    Bump to gherkin 2.5.1 - Omit step in Match JSON.

[33mcommit 7ce1793fc675fab07c53d52d1cdb433c43cd9bdf[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Sep 22 21:03:49 2011 +0100

    Upgrade gherkin dependency

[33mcommit 721bb3e0a22284914f3af7ef0ebc9a6fcfff6074[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Sep 21 20:34:25 2011 +0100

    Fix a test

[33mcommit 86c12ee123073e695d49ee1d02b69e6b06c66438[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Sep 17 09:48:59 2011 +0100

    Change dependencies so that full-jars don't bundle all jars (users are expected to provide them themselves). Closes #28.

[33mcommit c67fa4b3a4ccd3842b6871f9c22921144ffef2a1[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Sep 16 19:33:18 2011 +0100

    Upgrade IDEA modules (and tweak test)

[33mcommit 388ce3e7b599afe9f889b49009eb3c7fa290133c[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Sep 14 20:40:06 2011 +0100

    Simplified improved snippet code, removed hamcrest (not a huge fan).

[33mcommit 2f84f946adcc45dd491c318e9e3c2d37952b3e79[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Sep 11 10:09:31 2011 +0100

    Moved JUnit support to new submodule cucumber-junit. JUnit runner will now output results using the prettyformatter if the system property cucumber.reporter is set to pretty or pretty=somefile. The Backend interface has changed. Less methods to implement, and buildWorld() takes a World object where the Backend impl can register stepdefs and hooks. Currently this means scanning the fs/classpath for stepdefs/hooks for each scenario (slow), but this can be optimised later. This allows scoping of stepdefs on a per-feature (and later - per-scenario) basis.

[33mcommit faee0feaa294fce2bc37567fa90a35bfa78f1edc[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Sep 5 17:19:28 2011 +0100

    Use gherkin 2.4.18 from Maven Central

[33mcommit a47b36ff92a909defe20fd5916940e53c8ab8bb2[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Sep 3 14:29:14 2011 +0100

    Pass several script paths/packages to the Backend constructors. (We can't have a backend per package/script path, because code in backend A would not be able to talk to code in backend B)

[33mcommit 5325a8c9eea04bd9f7e82bd306dec4a295087af4[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Sep 3 12:49:11 2011 +0100

    Implement Table.asList(Class itemType). Clean up imports

[33mcommit 546c8de65c76c0d135bef400f4d3ebcf7b95dd89[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Sep 3 12:10:31 2011 +0100

    Moved table conversion logic from java to core

[33mcommit a322ed264a237d355e4c5128d321fd9f8327fdc8[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Sep 3 11:33:34 2011 +0100

    All building/passing except scala

[33mcommit 3d2af2c965029ecc149ddb02de2178d6d21c49d1[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Sep 1 23:28:13 2011 +0100

    Misc changes to bring in XStream to do some of the heavy object conversion lifting

[33mcommit 7b99a48e6d1741ebe6e4d3c987d6b4e7783aa8d7[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Aug 31 01:20:12 2011 +0100

    Merge with master. Simplified API for converting tables - no longer leaking the Java-specific TableProcessor implementation detail.

[33mcommit 76a4c54e91c676a615e099548104f851f49cf44e[m
Merge: b3b2672 8172113
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Aug 30 23:46:32 2011 +0100

    Merge branch 'master' into tables

[33mcommit b3b2672cc513db3a14cba37798fa0fde604803ff[m
Merge: fb0d1f2 c731102
Author: Cedric Lamalle <cedric.lamalle@gmail.com>
Date:   Sun Aug 28 14:39:57 2011 -0300

    Merge remote-tracking branch 'origin/tables' into tables

[33mcommit fb0d1f286ffdcc1f60d9d107ff010e5ad43bce3b[m
Author: Cedric Lamalle <cedric.lamalle@gmail.com>
Date:   Sun Aug 28 14:33:35 2011 -0300

    Working on Issue #19
    Added the possibility to process tables.
    Added a @JavaBeanClass annotation to allow passing list of beans to
    Steps.

[33mcommit c7311020f419cadff0156c329f6e3ac1143efc8f[m
Author: Cedric Lamalle <cedric.lamalle@gmail.com>
Date:   Sun Aug 28 14:33:35 2011 -0300

    Working on Issue #9
    Added the possibility to process tables.
    Added a @JavaBeanClass annotation to allow passing list of beans to
    Steps.

[33mcommit 8172113ce5503cd2353fce4fd7dc89f4c662210b[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Aug 25 22:14:40 2011 +0100

    Added tag support for tags. Closes #9. Closes #10.

[33mcommit 30a426fe18b0fb4eee8fa82075c699634fc4970f[m
Author: Alan Parkinson <alan.parkinson@storyiq.com>
Date:   Thu Aug 25 18:17:38 2011 +0100

    gh-9 Clean up tabs in last commit

[33mcommit 534d654e076831aa8b130ee788b62bb23ee6c30e[m
Author: Alan Parkinson <alan.parkinson@storyiq.com>
Date:   Thu Aug 25 14:20:55 2011 +0100

    gh-9 Very basic Java implementation of hooks

[33mcommit 31dbed9502c88edf8f7a3f8e352fa4d3ee6efdf4[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Wed Aug 24 00:07:23 2011 +0100

    Upgraded to gherkin 2.4.15, which considerably simplifies diffing logic.

[33mcommit 68cb112542f6bf61299281c43fe2d4d64d09fd41[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Aug 23 20:48:21 2011 +0100

    Merge with master

[33mcommit 5247a4aad07d246e56e3f5ff975f98a4dd26e648[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Aug 23 20:31:06 2011 +0100

    Renamed packages. Started work on line support - needs more work.

[33mcommit ec4c43c38b567a08d308e6bd4908bd5291d80ff7[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Aug 22 19:16:52 2011 +0100

    Changed groupId to info.cukes, and prepended cucumber- to all artifacts. Added shade plugin, so all artifacts have a -full (self contained) jar. Closes #11.

[33mcommit b049407be325c9adac6ab3c7c6047ff8f415729f[m
Merge: a1a9fea 410bdfe
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Aug 22 12:31:33 2011 +0100

    Pom hacking

[33mcommit a1a9fea58132c80a87e5fe5f842415135423acd9[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Aug 20 18:26:56 2011 +0100

    Upgrade deps

[33mcommit 44b865cd69b2d0f7561e6f4fa1ca2725293c0fdb[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Aug 20 16:58:25 2011 +0100

    Reimported projects

[33mcommit ff345d89374582de3e3375b8812fec3e50d808e7[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Aug 20 16:54:09 2011 +0100

    Fix version/newline/maven problems

[33mcommit e0ea600ad1492be6c047bca2a72688e220e89dc9[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Aug 20 15:48:08 2011 +0100

    Ambiguous matches are now reported correctly. Snippets are printed from CLI.

[33mcommit 410bdfe6a2e086ca8d92eae98c0f479f2bd7b0b8[m
Author: Sébastien Le Callonnec <sebastien@weblogism.com>
Date:   Sat Aug 20 14:37:53 2011 +0100

    Fixed pom issues

[33mcommit 9b84aa50062718d3309be938874d767eb6396992[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sat Aug 20 14:11:55 2011 +0100

    Better CLI runner

[33mcommit 90fbdb742c877b43509537a57ed335e92cc8d4b8[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Fri Aug 19 21:26:55 2011 +0100

    Added an example

[33mcommit 9e66f16af1dac0336c52d8a6aafc0f6cfb13e9f9[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Aug 18 08:17:15 2011 +0100

    Added hacking instructions

[33mcommit e7fbcb00f2454d1f7e394176aca28a3191f4a09e[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Aug 15 23:13:01 2011 +0100

    Take Locale from Gherkin feature instead of Step Definition. Make an outer Java class for each annotation - makes imports nicer (No more @EN.Given). Moved Java annotation code to java project.

[33mcommit 4939056186ed93e15181fb4cd70d39cd2e13f868[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Sun Aug 14 20:25:32 2011 +0100

    move cuke4duke.internal.Utils to cucumber.runtime.Utils

[33mcommit f240f981593a8eb2bffcaba8d9b549f99f7afdd8[m
Merge: 0e7b3ed be43613
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Aug 11 14:27:57 2011 +0100

    Merge with cedric-lamalle

[33mcommit 0e7b3eda697bfb255847a5e0ca1a91d44d9ab37b[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Thu Aug 11 01:31:51 2011 +0100

    Started on a CLI as an alternative to JUnit. This is necessary for other JVM languages that don't use JUnit (Clojure for example). Currently using some of the JUnit classes - will decouple this later.

[33mcommit c9c7e3ad23fdf058f7f93e56eaa8ff78dc8ed411[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Tue Aug 9 20:16:07 2011 +0100

    All core cucumber-features are passing except one

[33mcommit be43613ec45fd38b39c334c58e1b9e6c074ca001[m
Author: cedric.lamalle <cedric.lamalle@gmail.com>
Date:   Sat Aug 6 14:51:52 2011 -0300

    Cleaning poms from duplicate project versions.

[33mcommit ba70a4832ecc369e1bc53beb8899d2a9bdd7471d[m
Author: cedric-lamalle <cedric.lamlle@gmail.com>
Date:   Thu Jul 21 09:09:07 2011 -0300

    Adding eclipse project files to .gitignore

[33mcommit e90faddd03f819c65c169c421d807dd8fecd2f1a[m
Author: cedric-lamalle <cedric.lamalle@gmail.com>
Date:   Thu Jul 21 01:28:54 2011 -0300

    Adding locale in StepDefinition in order to transform arguments. It
    would be better to have locale set on an higher level, for instance
    Feature.

[33mcommit 715e46b861b21b188982304075370cc05f736771[m
Author: cedric-lamalle <cedric.lamalle@gmail.com>
Date:   Thu Jul 21 01:09:16 2011 -0300

    Moving Groovy code generation to groovy project.
    Altering Rakefiles to include rubygems.

[33mcommit 401f47da936b6e15251b9844717b8ac961d29166[m
Author: Aslak Hellesøy <aslak.hellesoy@gmail.com>
Date:   Mon Jun 27 20:53:41 2011 +0100

    Moved stuff around
