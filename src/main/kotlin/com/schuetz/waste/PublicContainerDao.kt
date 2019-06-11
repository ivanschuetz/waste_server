package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class PublicContainerDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun publicContainers(itemId: Long): List<PContainerDTO> = jdbcTemplate.query(
        "select c.id, c.name, c.address, c.lat, c.lon " +
            "from item i " +
            "inner join item_category ic on i.id = ic.item_id " +
            "inner join category_p_container cc on ic.category_id = cc.category_id " +
            "inner join p_container c on cc.p_container_id = c.id " +
            "where i.id = ?", arrayOf(itemId)) { result: ResultSet, _: Int ->
                PContainerDTO(
                    result.getLong("id"),
                    result.getString("name"),
                    result.getString("address"),
                    result.getFloat("lat"),
                    result.getFloat("lon")
                )
    }
}
