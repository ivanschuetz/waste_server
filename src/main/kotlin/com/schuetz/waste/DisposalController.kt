package com.schuetz.waste

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

@RestController
class DisposalController(val containerDao: ContainerDao, val publicContainerDao: PublicContainerDao,
                         val pickupCompaniesDao: PickupCompaniesDao) {

    @GetMapping("/containers/{itemId}")
    @ResponseBody
    fun containers(@PathVariable itemId: Long): List<ContainerDTO> = containerDao.containers(itemId)

    @GetMapping("/p_containers/{itemId}")
    @ResponseBody
    fun disposal(@PathVariable itemId: Long): List<PContainerDTO> = publicContainerDao.publicContainers(itemId)

    @GetMapping("/options/{itemId}")
    @ResponseBody
    fun options(@PathVariable itemId: Long): DisposalOptionsResult = DisposalOptionsResult(
        containerDao.containers(itemId),
        publicContainerDao.publicContainers(itemId),
        pickupCompaniesDao.companies(itemId)
    )
}
