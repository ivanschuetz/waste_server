package com.schuetz.waste

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

@RestController
class ItemsController(val itemDao: ItemDao) {

    @GetMapping("/items")
    @ResponseBody
    fun items(): List<Item> = itemDao.items()

    @GetMapping("/search/{term}")
    @ResponseBody
    fun search(@PathVariable term: String): List<Item> = itemDao.search(term)
}
