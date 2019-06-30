package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class ItemSearchDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun search(term: String, lang: String): ItemDTO? = jdbcTemplate.query(
        "select i.id, t.trans as name " +
            "from item i " +
            "inner join translations t on i.name = t.tkey " +
            "where lower(t.trans) = ? and t.lang = ?",
        arrayOf(
            term.toLowerCase(),
            lang
        )) { result: ResultSet, _: Int ->
            ItemDTO(
                result.getLong("id"),
                result.getString("name")
            )
        }.also {
            if (it.size > 1) {
                println("WARN: Multiple entries found with same (translated) name: $it")
            }
        }.firstOrNull()
}
