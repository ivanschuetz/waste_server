package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet
import java.util.UUID

class CategoryDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun categories(itemUuid: String, lang: String): List<CategoryResult> = jdbcTemplate.query(
        "select c.uuid, t.tkey, t.trans as name " +
            "from item i " +
            "inner join item_category ic on i.id = ic.item_id " +
            "inner join category c on c.id = ic.category_id " +
            "inner join translations t on c.name = t.tkey " +
            "where i.uuid = ? and t.lang = ?", arrayOf(UUID.fromString(itemUuid), lang)) { result: ResultSet, _: Int ->
        CategoryResult(
            result.getString("uuid"),
            result.getString("tkey"),
            result.getString("name")
        )
    }
}

// We need the translation key here too, to be able to collapse categories in controller. So special result type.
data class CategoryResult(val uuid: String, val nameKey: String, val nameTranslation: String)