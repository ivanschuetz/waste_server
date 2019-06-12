package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class PickupCompaniesDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    // TODO filter by city
    fun companies(itemId: Long): List<PickupCompanyResultDTO> = jdbcTemplate.query(
        "select p.id, p.name, p.city, p.website, p.phone, p.email, cc.min_weight, cc.website as cat_website " +
            "from item i " +
            "inner join item_category ic on i.id = ic.item_id " +
            "inner join category_pickup_company cc on ic.category_id = cc.category_id " +
            "inner join pickup_company p on cc.company_id = p.id " +
            "where i.id = ?", arrayOf(itemId)) { result: ResultSet, _: Int ->
        PickupCompanyResultDTO(
            PickupCompanyDTO(
                result.getLong("id"),
                result.getString("name"),
                result.getString("city"),
                result.getString("website"),
                result.getString("phone"),
                result.getString("email")
            ),
            result.getFloat("min_weight"),
            result.getString("cat_website")
        )
    }
}
