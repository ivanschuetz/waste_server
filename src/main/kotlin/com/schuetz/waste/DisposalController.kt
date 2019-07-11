package com.schuetz.waste

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestHeader
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

@RestController
class DisposalController(val containerDao: ContainerDao, val recipientsDao: RecipientsDao,
                         val categoryDao: CategoryDao, val itemTipDao: ItemTipDao, val categoryTipDao: CategoryTipDao) {

    @GetMapping("/options/{itemId}")
    @ResponseBody
    fun options(@PathVariable itemId: Long, @RequestHeader("lang") lang: String): DisposalOptionsResult {
        if (itemId < 0) {
            throw BadRequestException()
        }
        if (lang.length > 10) { // Block evidently malicious content
            println("ERROR: Bad request, lang has suspicious length: $lang")
            throw BadRequestException()
        }
        val actualLang = extractValidLanguage(lang)

        return DisposalOptionsResult(
            categoryDao.categories(itemId, actualLang),
            containerDao.containers(itemId, actualLang),
            recipientsDao.recipients(itemId),
            itemTipDao.tips(itemId, actualLang),
            categoryTipDao.tips(itemId, actualLang)
        )
    }
}
