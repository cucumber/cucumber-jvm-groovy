package io.cucumber.groovy;

import org.apiguardian.api.API;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * <p>
 * This annotation can be specified on step definition method parameters to give
 * Cucumber a hint to transpose a DataTable.
 * <p>
 * For example, if you have the following Gherkin step with a table
 *
 * <pre>
 * Given the user is
 *    | firstname	| Roberto	|
 *    | lastname	| Lo Giacco |
 *    | nationality	| Italian	|
 * </pre>
 * <p>
 * And a data table type to create a User
 *
 * <pre>
 * {@code
 * &#64;DataTableType
 * public User convert(Map<String, String> entry){
 *    return new User(
 *        entry.get("firstname"),
 *        entry.get("lastname")
 *        entry.get("nationality")
 *   );
 * }
 * }
 * </pre>
 * <p>
 * Then the following Groovy Step Definition would convert that into an User
 * object:
 *
 * <pre>
 * Given("^the user is$"){ &#064;Transpose User user -&gt;
 *     this.user = user;
 * }
 * </pre>
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.PARAMETER})
@API(status = API.Status.STABLE)
public @interface Transpose {

    boolean value() default true;

}
