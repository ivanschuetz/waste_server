package com.schuetz.waste

data class PContainerDTO(val id: Long, val name: String?, val address: String, val company: String, val phone: String?,
                         val url: String?, val lat: Float, val lon: Float, val openType: String, val open: Open)

sealed class Open {
    object Always : Open()
    object Unknown : Open()
    data class Hours(val hours: List<OpeningHours>) : Open()
}

data class OpeningHours(val weekday: Weekday, val start: HoursMins, val end: HoursMins)

data class HoursMins(val hours: String, val mins: String)

enum class Weekday { MO, TU, WE, TH, FR, SA, SU }
