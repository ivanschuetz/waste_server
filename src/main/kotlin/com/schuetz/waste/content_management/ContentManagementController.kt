package com.schuetz.waste.content_management

import com.schuetz.waste.RecipientDao
import com.weddini.throttling.Throttling
import com.weddini.throttling.ThrottlingType.RemoteAddr
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController
import java.util.concurrent.TimeUnit.SECONDS

data class MyDTO(val foo: String) // TODO remove
data class MyResultDTO(val bar: String) // TODO remove

@RestController
class ContentManagemenetController(private val recipientDao: RecipientDao) {

    @PostMapping("/addRecipient")
    @Throttling(type = RemoteAddr, limit = 1, timeUnit = SECONDS)
    @ResponseBody
//    fun addRecipient(@RequestBody recipientInputDTO: AddRecipientInputDTO) {
    fun addRecipient(@RequestBody recipientInputDTO: MyDTO): MyResultDTO {
        return MyResultDTO("success!: ${recipientInputDTO.foo}")
//        recipientDao.add(recipientInputDTO.recipient).also {
//            println(">>>> Updated! result: $it")
//        }
    }
}
