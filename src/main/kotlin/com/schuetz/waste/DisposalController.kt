package com.schuetz.waste

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestHeader
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

@RestController
class DisposalController(val containerDao: ContainerDao, val publicContainerDao: PublicContainerDao,
                         val pickupCompaniesDao: PickupCompaniesDao) {

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
            containerDao.containers(itemId, actualLang),
            publicContainerDao.publicContainers(itemId),
            pickupCompaniesDao.companies(itemId)
        )
    }
}
