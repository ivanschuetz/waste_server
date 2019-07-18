package com.schuetz.waste

data class RecipientDTO(val id: String, val name: String?, val address: String?, val company: String?, val phone: String?,
                         val url: String?, val email: String?, val lat: Float?, val lon: Float?, val openType: String,
                        val open: Open, val type: Int, val hasPickup: Boolean, val hasInPlace: Boolean)

sealed class Open {
    object Always : Open()
    object Unknown : Open()
    data class Hours(val hours: List<OpeningHours>) : Open()
}

data class OpeningHours(val weekday: Weekday, val start: HoursMins, val end: HoursMins)

data class HoursMins(val hours: String, val mins: String)

enum class Weekday { MO, TU, WE, TH, FR, SA, SU }
