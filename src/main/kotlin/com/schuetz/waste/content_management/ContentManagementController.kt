package com.schuetz.waste.content_management

import com.schuetz.waste.RecipientDao
import com.schuetz.waste.model.ResultStatus.SUCCESS
import com.schuetz.waste.model.ResultStatus.UNKNOWN_ERROR
import com.schuetz.waste.model.UpdateResult
import com.schuetz.waste.model.UpdateResultDTO
import com.schuetz.waste.pos.input.RecipientInputDTO
import com.weddini.throttling.Throttling
import com.weddini.throttling.ThrottlingType.RemoteAddr
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController
import java.util.concurrent.TimeUnit.SECONDS

@RestController
class ContentManagemenetController(private val recipientDao: RecipientDao) {

    @PostMapping("/addRecipient")
    @Throttling(type = RemoteAddr, limit = 1, timeUnit = SECONDS)
    @ResponseBody
    fun addRecipient(@RequestBody recipientInputDTO: RecipientInputDTO): UpdateResultDTO =
        recipientDao.add(recipientInputDTO).let {
            UpdateResult(if (it) SUCCESS else UNKNOWN_ERROR).toDTO()
        }
}
