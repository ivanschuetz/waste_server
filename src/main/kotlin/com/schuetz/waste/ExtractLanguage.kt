package com.schuetz.waste

fun extractValidLanguage(langStr: String): String = when {
    langStr.length < 2 || langStr.length > 5 -> null
    langStr.length == 2 -> if (isSupportedLang(langStr)) langStr else null
    else -> langStr.split("-").firstOrNull()?.takeIf { isSupportedLang(it) }
} ?: {
    println("Invalid langStr: $langStr. Defaulting to English.")
    "en"
}()

private fun isSupportedLang(langCode: String) = langCode == "en" || langCode == "de" || langCode == "tr"
