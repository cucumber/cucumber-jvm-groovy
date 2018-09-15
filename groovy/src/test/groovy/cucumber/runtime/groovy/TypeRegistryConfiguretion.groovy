package cucumber.runtime.groovy

import cucumber.api.TypeRegistry
import cucumber.api.TypeRegistryConfigurer
import io.cucumber.cucumberexpressions.ParameterType
import io.cucumber.cucumberexpressions.Transformer
import io.cucumber.datatable.DataTableType
import io.cucumber.datatable.TableEntryTransformer

import java.text.SimpleDateFormat

import static java.util.Locale.ENGLISH

class TypeRegistryConfiguration implements TypeRegistryConfigurer {

    @Override
    Locale locale() {
        return ENGLISH
    }

    @Override
    void configureTypeRegistry(TypeRegistry typeRegistry) {
       final TableEntryTransformer<Thing> transformer =new TableEntryTransformer<>() {
           @Override
           Thing transform(Map<String, String> tableEntry) {
               Thing thing = new Thing()
               thing.year = Integer.valueOf(tableEntry.get("year"))
               thing.name = tableEntry.get("name")
               thing
           }
       }
        typeRegistry.defineDataTableType(new DataTableType(Thing.class,transformer ))

        Transformer<DateWrapper> dateTransformer = new Transformer<DateWrapper>() {
            @Override
            DateWrapper transform(String s) throws Throwable {
                def df = new SimpleDateFormat("yyyy-MM-dd")
                return new DateWrapper(date:df.parse(s))
            }
        }

        Transformer<List> listTransformer = new Transformer<List>() {
            @Override
            List transform(String s) throws Throwable {
                return Arrays.asList(s.split(","))*.trim()
            }
        }
        typeRegistry.defineParameterType(new ParameterType<>(
                "date",
                "\\d{4}-\\d{2}-\\d{2}",
                DateWrapper.class,
                dateTransformer
        ))

        typeRegistry.defineParameterType(new ParameterType<>(
                "list",
                "(.+\\s*,\\s*.+){1,}",
                List.class,
                listTransformer
        ))
    }
}
