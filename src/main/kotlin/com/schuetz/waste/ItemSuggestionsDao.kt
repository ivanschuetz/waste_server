package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class ItemSuggestionsDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun search(term: String, lang: String): List<ItemSuggestionDTO> = jdbcTemplate.query(
        "select i.id, t.trans as name " +
            "from item i " +
            "inner join translations t on i.name = t.tkey " +
            "where lower(t.trans) like ? and t.lang = ? " +
            "order by t.trans " +
            "limit 10",
        arrayOf(
            "%${term.toLowerCase()}%",
            lang
        )) { result: ResultSet, _: Int ->
            ItemSuggestionDTO(
                result.getLong("id"),
                result.getString("name")
            )
        }
}
