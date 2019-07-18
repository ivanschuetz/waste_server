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

        return DisposalOptionsResult(
            categoryDao.categories(itemUuid, actualLang),
            containerDao.containers(itemUuid, actualLang),
            itemRecipientsDao.recipients(itemUuid),
            categoryRecipientsDao.recipients(itemUuid),
            itemTipDao.tips(itemUuid, actualLang),
            categoryTipDao.tips(itemUuid, actualLang)
        )
    }
}
