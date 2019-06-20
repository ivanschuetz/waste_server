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
        if (lang.length > 2) {
            println("ERROR: Bad request, lang has incorrect length: $lang")
            throw BadRequestException()
        }
        if (lang != "de" && lang != "en") {
            println("ERROR: Bad request, wrong lang: $lang")
            throw BadRequestException()
        }

        return DisposalOptionsResult(
            containerDao.containers(itemId, lang),
            publicContainerDao.publicContainers(itemId),
            pickupCompaniesDao.companies(itemId)
        )
    }
}
