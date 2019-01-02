package cucumber.runtime.groovy

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule
import cucumber.api.TypeRegistry
import cucumber.api.TypeRegistryConfigurer
import io.cucumber.cucumberexpressions.ParameterByTypeTransformer
import io.cucumber.cucumberexpressions.ParameterType
import io.cucumber.cucumberexpressions.Transformer
import io.cucumber.datatable.DataTableType
import io.cucumber.datatable.TableCellByTypeTransformer
import io.cucumber.datatable.TableEntryByTypeTransformer
import io.cucumber.datatable.TableEntryTransformer

import java.lang.reflect.Type
import java.time.LocalDate

import static java.util.Locale.ENGLISH

class TypeRegistryConfiguration implements TypeRegistryConfigurer {

    @Override
    Locale locale() {
        return ENGLISH
    }

    @Override
    void configureTypeRegistry(TypeRegistry typeRegistry) {
        DefaultTransformer defaultTransformer = new DefaultTransformer()
        typeRegistry.setDefaultDataTableCellTransformer(defaultTransformer)
        typeRegistry.setDefaultDataTableEntryTransformer(defaultTransformer)
        typeRegistry.setDefaultParameterTransformer(defaultTransformer)

        final TableEntryTransformer<Thing> transformer = new TableEntryTransformer<Thing>() {
            @Override
            Thing transform(Map<String, String> tableEntry) {
                Thing thing = new Thing()
                thing.year = Integer.valueOf(tableEntry.get("year"))
                thing.name = tableEntry.get("name")
                thing
            }
        }
        typeRegistry.defineDataTableType(new DataTableType(Thing.class, transformer))

        Transformer<DateWrapper> dateTransformer = new Transformer<DateWrapper>() {
            @Override
            DateWrapper transform(String s) throws Throwable {
                return new DateWrapper(date: LocalDate.parse(s))
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

    private class DefaultTransformer implements ParameterByTypeTransformer, TableEntryByTypeTransformer, TableCellByTypeTransformer {
        ObjectMapper objectMapper = new ObjectMapper()

        DefaultTransformer() {
            objectMapper.registerModule(new JavaTimeModule());
        }

        @Override
        Object transform(String s, Type type) {
            return objectMapper.convertValue(s, objectMapper.constructType(type))
        }

        @Override
        <T> T transform(Map<String, String> map, Class<T> aClass, TableCellByTypeTransformer tableCellByTypeTransformer) {
            return objectMapper.convertValue(map, aClass)
        }

        @Override
        <T> T transform(String s, Class<T> aClass) {
            return objectMapper.convertValue(s, aClass)
        }
    }
}
