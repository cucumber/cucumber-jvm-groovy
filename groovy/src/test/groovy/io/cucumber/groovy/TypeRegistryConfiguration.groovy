package io.cucumber.groovy


import io.cucumber.core.api.TypeRegistry
import io.cucumber.core.api.TypeRegistryConfigurer
import io.cucumber.cucumberexpressions.CaptureGroupTransformer
import io.cucumber.cucumberexpressions.ParameterType
import io.cucumber.datatable.DataTableType
import io.cucumber.datatable.TableEntryTransformer

import java.time.LocalDate

import static java.util.Locale.ENGLISH

class TypeRegistryConfiguration implements TypeRegistryConfigurer {

    @Override
    Locale locale() {
        return ENGLISH
    }

    @Override
    void configureTypeRegistry(TypeRegistry typeRegistry) {

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

        CaptureGroupTransformer<DateWrapper> dateTransformer =
                { String[] s -> new DateWrapper(date: LocalDate.parse(s[0])) }


        CaptureGroupTransformer<List> listTransformer = { String[] s ->
            return Arrays.asList(s[0].split(","))*.trim()
        }

        typeRegistry.defineParameterType(new ParameterType<>(
                "date",
                "(\\d{4}-\\d{2}-\\d{2})",
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
