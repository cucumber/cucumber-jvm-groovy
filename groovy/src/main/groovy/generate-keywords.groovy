import groovy.text.SimpleTemplateEngine
import gherkin.GherkinDialect
import gherkin.GherkinDialectProvider

def engine = new SimpleTemplateEngine()
def templateSource = new File(project.baseDir, "${File.separator}src${File.separator}main${File.separator}groovy${File.separator}I18n.groovy.gsp").getText()

def unsupported = ["EM"] // The generated files for Emoij do not compile.
def dialectProvider = new GherkinDialectProvider()

GherkinDialectProvider.DIALECTS.keySet().each { language ->
    def dialect = dialectProvider.getDialect(language, null)
    def normalized_language = dialect.language.replaceAll("[\\s-]", "_").toUpperCase()
    if (!unsupported.contains(normalized_language)) {
        def binding = ["i18n":dialect, "normalized_language":normalized_language]
        template = engine.createTemplate(templateSource).make(binding)
        def file = new File(project.baseDir, "target${File.separator}generated-sources${File.separator}i18n${File.separator}java${File.separator}cucumber${File.separator}api${File.separator}groovy${File.separator}${normalized_language}.java")
        file.parentFile.mkdirs()
        file.write(template.toString(), "UTF-8")
    }
}