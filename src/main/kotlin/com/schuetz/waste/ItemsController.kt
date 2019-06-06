package com.schuetz.waste

import com.schuetz.waste.HibernateUtil.openSession
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

@RestController
class ItemsController {

    @GetMapping("/items")
    @ResponseBody
    fun items(): List<Item> =
        openSession()?.createQuery("from Item", Item::class.java)?.list() ?: emptyList()
}
