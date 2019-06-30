package scripts

import scripts.ItemInsertResult.Full
import scripts.ItemInsertResult.NoTranslations
import scripts.TranslationLine.BlankLine
import scripts.TranslationLine.TranslationTranslationLine
import java.io.File

fun main() {
    val input = File("./src/main/resources/items_input.sql")

    val itemResults = input.readLines().map { toItemInsertResult(it) }

    val itemsDETranslations = itemResults.filterIsInstance(Full::class.java)
        .map { Translation(it.result.translationKey, it.result.translationDE, "de") }
    val itemsENTranslations = itemResults.filterIsInstance(Full::class.java)
        .map { Translation(it.result.translationKey, it.result.translationEN, "en") }

    val outputDE = File("./src/main/resources/translations_de.sql")
    val outputEN = File("./src/main/resources/translations_en.sql")

    val translationsDE: List<TranslationLine> = outputDE.readLines().map { toTranslation(it) }
    val translationsEN: List<TranslationLine> = outputEN.readLines().map { toTranslation(it) }

    val translationsDEMap = translationsDE.filterIsInstance(TranslationTranslationLine::class.java).associateBy { it.translation.key }
    val translationsENMap = translationsEN.filterIsInstance(TranslationTranslationLine::class.java).associateBy { it.translation.key }

    val newTranslationsDE: List<TranslationLine> = itemsDETranslations
        .filterNot {
            translationsDEMap.containsKey(it.key) }
        .map { TranslationTranslationLine(it) }

    val newTranslationsEN: List<TranslationLine> = itemsENTranslations
        .filterNot { translationsENMap.containsKey(it.key) }
        .map { TranslationTranslationLine(it) }

    println("New translation count (DE) = ${newTranslationsDE.size}")
    if (newTranslationsDE.isNotEmpty()) {
        outputDE.appendText("\n")
        for (translationLine in newTranslationsDE) {
            outputDE.appendText(toSQL(translationLine))
        }
    }

    println("New translation count (EN) = ${newTranslationsEN.size}")
    if (newTranslationsEN.isNotEmpty()) {
        outputEN.appendText("\n")
        for (translationLine in newTranslationsEN) {
            outputEN.appendText(toSQL(translationLine))
        }
    }

    val untranslatedItemsDETranslations = itemResults
        .filterIsInstance(NoTranslations::class.java)
        .filterNot { translationsDEMap.containsKey(it.translationKey) }

    val untranslatedItemsENTranslations = itemResults
        .filterIsInstance(NoTranslations::class.java)
        .filterNot { translationsENMap.containsKey(it.translationKey) }

    println("-----------------------------------------------")
    println("Missing new DE items translations (${untranslatedItemsDETranslations.size}):")
    println("-----------------------------------------------")
    untranslatedItemsDETranslations.forEach {
        println(it)
    }

    println("-----------------------------------------------")
    println("Missing new EN items translations (${untranslatedItemsENTranslations.size}):")
    println("-----------------------------------------------")
    untranslatedItemsENTranslations.forEach {
        println(it)
    }

    println("Finished!")
}

fun toSQL(translationLine: TranslationLine): String = when (translationLine) {
    is BlankLine -> "\n"
    is TranslationTranslationLine -> translationLine.translation.let {
        "INSERT INTO translations(tkey, lang, trans) VALUES('${it.key}', '${it.lang}', '${it.translation}');\n"
    }
}

fun toTranslation(line: String): TranslationLine {
    val regex = """VALUES\((.*?)\);""".toRegex()
    val valuesRegex = """^'(.*)', '(.*)', '(.*)'$""".toRegex()
    val match = regex.find(line)
    return match?.groupValues?.get(1)?.let { valuesStr ->
        valuesRegex.find(valuesStr)?.groupValues?.let { values ->
            TranslationTranslationLine(Translation(values[1], values[3], values[2]))
        } ?: {
            throw Error("Invalid input: $valuesStr")
        }()
    } ?: {
        if (line.trim().isEmpty()) {
            BlankLine
        } else {
            throw Error("Invalid input in translations sql: $line")
        }
    }()
}

fun toItemInsertResult(line: String): ItemInsertResult? {
    val fullRegex = """INSERT INTO item\(.*VALUES\(.*?'(.*?)'.*? --(.*)=(.*)""".toRegex()
    val onlyTranslationKeyRegex = """INSERT INTO item\(.*VALUES\(.*?'(.*?)'.*""".toRegex()
//    val itemCategoryLineRegex = """.*INSERT INTO item_category.*;""".toRegex()
//    val itemCategoryLineRegex = """INSERT INTO item_category\(item_id, category_id\) VALUES\(.*?\);""".toRegex()
    val itemCategoryLineRegex = """^(--)?INSERT INTO item_category\(item_id, category_id\) VALUES\(.*\);( -- TODO .*)?$""".toRegex()
    return fullRegex.find(line)?.groupValues?.let {
        Full(FullItemInsertResult(it[1].trim(), it[2].trim(), it[3].trim()))
    } ?: {
        onlyTranslationKeyRegex.find(line)?.let {
            if (!line.startsWith("--")) { // Ignore commented lines
                NoTranslations(it.groupValues[1])
            } else {
                null
            }
        }
    } () ?: {
        if (line.trim() != "" && !itemCategoryLineRegex.matches(line) && !line.startsWith("--")) {
            throw Error("Not handled line: $line")
        } else {
            null
        }
    } ()
}

data class Translation(val key: String, val translation: String, val lang: String)
data class FullItemInsertResult(val translationKey: String, val translationEN: String, val translationDE: String)

sealed class TranslationLine {
    object BlankLine : TranslationLine()
    data class TranslationTranslationLine(val translation: Translation) : TranslationLine()
}

sealed class ItemInsertResult {
    data class Full(val result: FullItemInsertResult): ItemInsertResult()
    data class NoTranslations(val translationKey: String): ItemInsertResult()
}

