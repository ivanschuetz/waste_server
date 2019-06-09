package com.schuetz.waste

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController

@RestController
class DisposalController(val containerDao: ContainerDao) {

    @GetMapping("/disp/{itemId}")
    @ResponseBody
    fun containers(@PathVariable itemId: Long): List<ContainerDTO> = containerDao.containers(itemId)
}
