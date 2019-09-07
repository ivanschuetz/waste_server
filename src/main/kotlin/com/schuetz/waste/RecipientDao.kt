package com.schuetz.waste

import com.schuetz.waste.pos.input.RecipientInputDTO
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate

class RecipientDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun add(recipientDTO: RecipientInputDTO): Boolean {
        val count = jdbcTemplate.update(
            """INSERT INTO recipient(name, address, company, phone, url, email, lat, lon, city, open, type, hasPickup, hasInPlace) 
                |VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""".trimMargin(),
            recipientDTO.name,
            recipientDTO.address,
            recipientDTO.company,
            recipientDTO.phone,
            recipientDTO.url,
            recipientDTO.email,
            recipientDTO.lat,
            recipientDTO.lon,
            recipientDTO.city,
            recipientDTO.openType,
            recipientDTO.type,
            recipientDTO.hasPickup.asInt,
            recipientDTO.hasInPlace.asInt
        )
        return count == 1
    }
}

private val Boolean.asInt get() = if (this) 1 else 0
