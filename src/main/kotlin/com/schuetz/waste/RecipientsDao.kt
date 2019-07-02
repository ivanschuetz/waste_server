package com.schuetz.waste

import com.fasterxml.jackson.core.type.TypeReference
import com.fasterxml.jackson.databind.ObjectMapper
import com.schuetz.waste.Open.Always
import com.schuetz.waste.Open.Hours
import com.schuetz.waste.Open.Unknown
import com.schuetz.waste.Weekday.FR
import com.schuetz.waste.Weekday.MO
import com.schuetz.waste.Weekday.SA
import com.schuetz.waste.Weekday.SU
import com.schuetz.waste.Weekday.TH
import com.schuetz.waste.Weekday.TU
import com.schuetz.waste.Weekday.WE
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.ResultSet

class RecipientsDao {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    private val mapper = ObjectMapper()

    fun recipients(itemId: Long): List<RecipientDTO> = jdbcTemplate.query(
        "select r.id, r.name, r.address, r.company, r.phone, r.url, r.email, r.lat, r.lon, r.open, r.type, r.hasPickup, r.hasInPlace, json_agg(h) as json " +
            "from item i " +
            "inner join item_category ic on i.id = ic.item_id " +
            "inner join category_recipient cr on ic.category_id = cr.category_id " +
            "inner join recipient r on cr.recipient_id = r.id " +
            "left join recipient_hours h on h.recipient_id = r.id " +
            "where i.id = ? group by r.id", arrayOf(itemId)) { result: ResultSet, _: Int ->

        val open = toOpen(result.getString("open"), result.getString("json"))

        RecipientDTO(
            result.getLong("id"),
            result.getString("name"),
            result.getString("address"),
            result.getString("company"),
            result.getString("phone"),
            result.getString("url"),
            result.getString("email"),
            result.getFloat("lat"),
            result.getFloat("lon"),
            toOpenIdentifier(open),
            open,
            result.getInt("type"),
            toBoolean(result.getInt("hasPickup")),
            toBoolean(result.getInt("hasInPlace"))
        )
    }

    private fun toBoolean(intValue: Int) = when (intValue) {
        0 -> false
        1 -> true
        else -> throw Error("Invalid intValue: $intValue")
    }

    private fun toOpenIdentifier(open: Open): String = when(open) {
        is Always -> "a"
        is Hours -> "h"
        is Unknown -> "u"
    }

    private fun toOpen(type: String, openingHoursJson: String?): Open = when (type) {
        "a" -> Always
        "u" -> Unknown
        "h" -> if (openingHoursJson == null || openingHoursJson == "[null]") {
            Unknown
        } else {
            val openingHoursRows: List<OpeningHoursRow> = mapper.readValue(openingHoursJson, object : TypeReference<List<OpeningHoursRow>>() {})

            // TODO distinct(): Try to do this with SQL instead. Currently when an item has multiple categories, the join with public containers
            // TODO will have duplicates. The group by works to return just one container, but when joining with hours the JSON for some reason
            // TODO contains duplicate entries. How do retrieve unique entries in JSON?
            val openingHours = openingHoursRows.map { it.toOpeningHours() }.distinct()

            Hours(openingHours)
        }
        else -> throw RuntimeException("Invalid open type: $type")
    }

    private fun OpeningHoursRow.toOpeningHours() =
        OpeningHours(toWeekday(weekday), toHoursMins(start), toHoursMins(finish))

    private fun toHoursMins(str: String): HoursMins = str.split(":").let { tokens ->
        HoursMins(tokens[0], tokens[1])
    }

    private fun toWeekday(weekdayStr: String) = when (weekdayStr) {
        "mo" -> MO
        "tu" -> TU
        "we" -> WE
        "th" -> TH
        "fr" -> FR
        "sa" -> SA
        "su" -> SU
        else -> throw RuntimeException("Invalid weekday string: $weekdayStr")
    }
}

data class OpeningHoursRow(var recipient_id: String = "", var weekday: String = "", var start: String = "", var finish: String = "")
