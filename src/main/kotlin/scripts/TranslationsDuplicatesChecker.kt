package scripts

import scripts.TranslationLine.TranslationTranslationLine
import java.io.File

fun main() {
    val outputDE = File("./src/main/resources/translations_de.sql")
    val outputEN = File("./src/main/resources/translations_en.sql")

    val translationsDE: List<TranslationTranslationLine> = outputDE.readLines().map { toTranslation(it) }.filterIsInstance(TranslationTranslationLine::class.java)
    val translationsEN: List<TranslationTranslationLine> = outputEN.readLines().map { toTranslation(it) }.filterIsInstance(TranslationTranslationLine::class.java)

    showDuplicates(translationsDE)
    showDuplicates(translationsEN)

    println("Finished checking for translation duplicates.")
}

private fun showDuplicates(translations: List<TranslationTranslationLine>) {

    for (i in 0 until translations.size) {
        val translation = translations[i]

        val duplicates = translations.subList(i + 1, translations.size).filter { t ->
            t.translation.key == translation.translation.key
        }

        if (duplicates.isNotEmpty()) {
            println("Duplicate: $translation")
            for (duplicate in duplicates) {
                println("Duplicate: $duplicate")
            }
        }
    }
}
