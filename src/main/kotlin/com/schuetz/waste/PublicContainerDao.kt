package com.schuetz.waste

import com.fasterxml.jackson.core.type.TypeReference
import com.fasterxml.jackson.databind.ObjectMapper
import com.schuetz.waste.Open.Always
import com.schuetz.waste.Open.Hours
import com.schuetz.waste.Open.Unknown
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class PublicContainerDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    private val mapper = ObjectMapper()

    fun publicContainers(itemId: Long): List<PContainerDTO> = jdbcTemplate.query(
        "select c.id, c.name, c.address, c.company, c.phone, c.url, c.lat, c.lon, c.open, json_agg(h) as json " +
            "from item i " +
            "inner join item_category ic on i.id = ic.item_id " +
            "inner join category_p_container cc on ic.category_id = cc.category_id " +
            "inner join p_container c on cc.p_container_id = c.id " +
            "left join p_container_hours h on h.p_container_id = c.id " +
            "where i.id = ? group by c.id", arrayOf(itemId)) { result: ResultSet, _: Int ->

        val open = toOpen(result.getString("open"), result.getString("json"))

        PContainerDTO(
            result.getLong("id"),
            result.getString("name"),
            result.getString("address"),
            result.getString("company"),
            result.getString("phone"),
            result.getString("url"),
            result.getFloat("lat"),
            result.getFloat("lon"),
            toOpenIdentifier(open),
            open
        )
    }

    private fun toOpenIdentifier(open: Open): String = when(open) {
        is Always -> "a"
        is Hours -> "h"
        is Unknown -> "u"
    }

    private fun toOpen(type: String, openingHoursJson: String?): Open = when (type) {
        "a" -> Always
        "h" -> if (openingHoursJson == null || openingHoursJson == "[null]") {
            Unknown
        } else {
            val openingHoursRows: List<OpeningHoursRow> = mapper.readValue(openingHoursJson, object : TypeReference<List<OpeningHoursRow>>() {})
            val openingHours = openingHoursRows.map { it.toOpeningHours() }
            Hours(openingHours)
        }
        else -> throw RuntimeException("Invalid open type: $type")
    }

    private fun OpeningHoursRow.toOpeningHours() =
        OpeningHours(toWeekday(weekday), toHoursMins(start), toHoursMins(finish))

    private fun toHoursMins(str: String): HoursMins = str.split(":").let { tokens ->
        HoursMins(tokens[0].toInt(), tokens[1].toInt())
    }

    private fun toWeekday(weekdayStr: String) = when (weekdayStr) {
        "mo" -> Weekday.MO
        "tu" -> Weekday.TU
        "we" -> Weekday.WE
        "th" -> Weekday.TH
        "fr" -> Weekday.FR
        "sa" -> Weekday.SA
        "su" -> Weekday.SU
        else -> throw RuntimeException("Invalid weekday string: $weekdayStr")
    }
}

data class OpeningHoursRow(var p_container_id: String = "", var weekday: String = "", var start: String = "", var finish: String = "")
