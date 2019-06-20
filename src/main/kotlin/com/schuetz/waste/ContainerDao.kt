package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class ContainerDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun containers(itemId: Long, lang: String): List<ContainerDTO> = jdbcTemplate.query(
        "select c.id, t.trans as name, c.color " +
            "from item i " +
            "inner join item_category ic on i.id = ic.item_id " +
            "inner join category_container cc on ic.category_id = cc.category_id " +
            "inner join container c on cc.container_id = c.id " +
            "inner join translations t on c.name = t.tkey " +
            "where i.id = ? and t.lang = ?", arrayOf(itemId, lang)) { result: ResultSet, _: Int ->
                ContainerDTO(
                    result.getLong("id"),
                    result.getString("name"),
                    result.getString("color")
                )
            }
}
