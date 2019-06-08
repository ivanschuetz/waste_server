package com.schuetz.waste

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

@RestController
class ItemsController(val itemSuggestionsDao: ItemSuggestionsDao) {

    @GetMapping("/items")
    @ResponseBody
    fun items(): List<ItemSuggestionDTO> = itemSuggestionsDao.items()

    @GetMapping("/search/{term}")
    @ResponseBody
    fun search(@PathVariable term: String): List<ItemSuggestionDTO> = itemSuggestionsDao.search(term)
}
