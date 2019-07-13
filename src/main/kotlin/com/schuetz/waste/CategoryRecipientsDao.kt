package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class CategoryRecipientsDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun recipients(itemId: Long): List<RecipientDTO> = jdbcTemplate.query(
        "select r.id, r.name, r.address, r.company, r.phone, r.url, r.email, r.lat, r.lon, r.open, r.type, r.hasPickup, r.hasInPlace, json_agg(h) as json " +
            "from item i " +
            "inner join item_category ic on i.id = ic.item_id " +
            "inner join category_recipient cr on ic.category_id = cr.category_id " +
            "inner join recipient r on cr.recipient_id = r.id " +
            "left join recipient_hours h on h.recipient_id = r.id " +
            "where i.id = ? group by r.id", arrayOf(itemId)) { result: ResultSet, _: Int -> toRecipientDTO(result) }
}
