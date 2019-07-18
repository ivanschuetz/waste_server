package com.schuetz.waste

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestHeader
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

@RestController
class DisposalController(val containerDao: ContainerDao,
                         val itemRecipientsDao: ItemRecipientsDao,
                         val categoryRecipientsDao: CategoryRecipientsDao,
                         val categoryDao: CategoryDao,
                         val itemTipDao: ItemTipDao,
                         val categoryTipDao: CategoryTipDao) {

    @GetMapping("/options/{itemUuid}")
    @ResponseBody
    fun options(@PathVariable itemUuid: String, @RequestHeader("lang") lang: String): DisposalOptionsResult {
        if (itemUuid.length != 36) {
            throw BadRequestException()
        }
        if (lang.length > 10) { // Block evidently malicious content
            println("ERROR: Bad request, lang has suspicious length: $lang")
            throw BadRequestException()
        }
        val actualLang = extractValidLanguage(lang)

        val categories = categoryDao.categories(itemUuid, actualLang)
            .collapseCategories("category_electro", listOf("category_electro_small"))
            .map { CategoryDTO(it.uuid, it.nameTranslation) }

        return DisposalOptionsResult(
            categories,
            containerDao.containers(itemUuid, actualLang),
            itemRecipientsDao.recipients(itemUuid),
            categoryRecipientsDao.recipients(itemUuid),
            itemTipDao.tips(itemUuid, actualLang),
            categoryTipDao.tips(itemUuid, actualLang)
        )
    }
}

/**
 * Removes categories (identified with translation keys) from list, when toPreserve category is present.
 * This is used for certain cases where showing similar categories to the client may seem unecessarily verbose.
 * E.g. "electro" and "electro small". Showing only "electro" is enough for the client.
 */
private fun List<CategoryResult>.collapseCategories(toPreserve: String, toRemove: List<String>): List<CategoryResult> {
    val categoryToPreserve: CategoryResult? = firstOrNull { it.nameKey == toPreserve }
    val categoriesToRemove: List<CategoryResult> = filter { category -> toRemove.any { tr -> tr == category.nameKey }}
    return when {
        categoryToPreserve != null && categoriesToRemove.isNotEmpty() -> {
            this - categoriesToRemove
        }
        else -> this
    }
}
