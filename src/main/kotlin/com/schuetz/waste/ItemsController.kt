package com.schuetz.waste

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestHeader
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

@RestController
class ItemsController(val itemSuggestionsDao: ItemSuggestionsDao) {
    @GetMapping("/search/{term}")
    @ResponseBody
    fun search(@PathVariable term: String, @RequestHeader("lang") lang: String): List<ItemSuggestionDTO> {
        if (term.length > 100) {
            println("ERROR: Bad request, term is too long: $term")
            throw BadRequestException()
        }
        if (lang.length > 10) { // Block evidently malicious content
            println("ERROR: Bad request, lang has suspicious length: $lang")
            throw BadRequestException()
        }
        val actualLang = extractValidLanguage(lang)

        return itemSuggestionsDao.search(term, actualLang)
    }
}
