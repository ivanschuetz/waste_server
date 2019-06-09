package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.web.bind.annotation.PathVariable
import java.sql.ResultSet

class ItemSuggestionsDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun search(@PathVariable term: String): List<ItemSuggestionDTO> = jdbcTemplate.query(
        "select * from item where name like ?", arrayOf("%$term%")) { result: ResultSet, _: Int ->
            ItemSuggestionDTO(
                result.getLong("id"),
                result.getString("name")
            )
        }
}
