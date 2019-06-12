package com.schuetz.waste

data class PContainerDTO(val id: Long, val name: String?, val address: String, val company: String, val phone: String?,
                         val url: String?, val lat: Float, val lon: Float)
