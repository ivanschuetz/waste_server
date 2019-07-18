package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.query
import java.sql.ResultSet
import java.util.UUID

class ItemRecipientsDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun recipients(itemUuid: String): List<RecipientDTO> = jdbcTemplate.query(
        "select r.uuid, r.name, r.address, r.company, r.phone, r.url, r.email, r.lat, r.lon, r.open, r.type, r.hasPickup, r.hasInPlace, json_agg(h) as json " +
            "from item i " +
            "inner join item_recipient ir on i.id = ir.item_id " +
            "inner join recipient r on ir.recipient_id = r.id " +
            "left join recipient_hours h on h.recipient_id = r.id " +
            "where i.uuid = ? group by r.id", UUID.fromString(itemUuid)) { result: ResultSet, _: Int -> toRecipientDTO(result) }
}
