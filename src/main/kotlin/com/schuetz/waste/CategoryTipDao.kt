package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class CategoryTipDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun tips(itemId: Long, lang: String): List<TipDTO> = jdbcTemplate.query(
        "select t.trans as text, tip.type " +
            "from item i " +
            "inner join item_category ic on i.id = ic.item_id " +
            "inner join category_tag ctag on ic.category_id = ctag.category_id " +
            "inner join tag_tip ttip on ctag.tag_id = ttip.tag_id " +
            "inner join tip tip on ttip.tip_id = tip.id " +
            "inner join translations t on tip.text = t.tkey " +
            "where i.id = ? and t.lang = ?",
        arrayOf(
            itemId,
            lang
        )) { result: ResultSet, _: Int ->
        TipDTO(
            result.getString("text"),
            result.getInt("type")
        )
    }
}
