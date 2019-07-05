package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class CategoryDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun categories(itemId: Long, lang: String): List<CategoryDTO> = jdbcTemplate.query(
        "select c.id, t.trans as name " +
            "from item i " +
            "inner join item_category ic on i.id = ic.item_id " +
            "inner join category c on c.id = ic.category_id " +
            "inner join translations t on c.name = t.tkey " +
            "where i.id = ? and t.lang = ?", arrayOf(itemId, lang)) { result: ResultSet, _: Int ->
        CategoryDTO(
            result.getLong("id"),
            result.getString("name")
        )
    }
}
