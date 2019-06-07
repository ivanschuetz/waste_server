package com.schuetz.waste

import com.schuetz.waste.HibernateUtil.openSession
import org.springframework.web.bind.annotation.PathVariable

class ItemDao {
    fun items(): List<Item> = openSession()
        ?.createQuery("from Item", Item::class.java)
        ?.list() ?: emptyList()

    fun search(@PathVariable term: String): List<Item> = openSession()
        ?.createQuery("from Item i where lower(i.name) LIKE lower(:term)", Item::class.java)
        ?.setParameter("term", "%$term%")
        ?.list() ?: emptyList()
}
