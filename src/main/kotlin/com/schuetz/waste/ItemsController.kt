package com.schuetz.waste

//import com.weddini.throttling.Throttling
//import com.weddini.throttling.ThrottlingType.RemoteAddr
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestHeader
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController
import java.util.concurrent.TimeUnit.MILLISECONDS

@RestController
class ItemsController(val itemSuggestionsDao: ItemSuggestionsDao, val itemSearchDao: ItemSearchDao) {
    @GetMapping("/suggestions/{term}")
//    @Throttling(type = RemoteAddr, limit = 200, timeUnit = MILLISECONDS)
    @ResponseBody
    fun suggestions(@PathVariable term: String, @RequestHeader("lang") lang: String): List<ItemDTO> {
        if (term.length > 100) {
            println("ERROR: Bad request, term is too long: $term")
            throw BadRequestException()
        }
        if (lang.length > 10) { // Block evidently malicious content
            println("ERROR: Bad request, lang has suspicious length: $lang")
            throw BadRequestException()
        }
        val actualLang = extractValidLanguage(lang)

        return itemSuggestionsDao.suggestions(term, actualLang)
    }

    @GetMapping("/search/{term}")
//    @Throttling(type = RemoteAddr, limit = 500, timeUnit = MILLISECONDS)
    @ResponseBody
    fun search(@PathVariable term: String, @RequestHeader("lang") lang: String): ItemDTO? {
        if (term.length > 100) {
            println("ERROR: Bad request, term is too long: $term")
            throw BadRequestException()
        }
        if (lang.length > 10) { // Block evidently malicious content
            println("ERROR: Bad request, lang has suspicious length: $lang")
            throw BadRequestException()
        }
        val actualLang = extractValidLanguage(lang)

        return itemSearchDao.search(term, actualLang)
    }
}
