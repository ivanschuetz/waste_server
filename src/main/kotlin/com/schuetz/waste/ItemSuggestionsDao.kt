package com.schuetz.waste

import com.schuetz.waste.HibernateUtil.openSession
import org.springframework.web.bind.annotation.PathVariable

class ItemSuggestionsDao {
    fun items(): List<ItemSuggestionDTO> = openSession()
        ?.createQuery("from Item", Item::class.java)
        ?.list()
        ?.toSuggestions()
        ?: emptyList()

    fun search(@PathVariable term: String): List<ItemSuggestionDTO> = openSession()
        ?.createQuery("from Item i where lower(i.name) LIKE lower(:term)", Item::class.java)
        ?.setParameter("term", "%$term%")
        ?.list()
        ?.toSuggestions()
        ?: emptyList()

    private fun List<Item>.toSuggestions() =
        mapNotNull { item -> item.getId()?.let { ItemSuggestionDTO(it, item.name) } }
}
