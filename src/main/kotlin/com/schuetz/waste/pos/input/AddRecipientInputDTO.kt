package com.schuetz.waste.pos.input

import com.fasterxml.jackson.annotation.JsonCreator
import com.schuetz.waste.OpeningHours

data class RecipientInputDTO @JsonCreator constructor(val name: String?, val address: String?, val company: String?,
                                                      val phone: String?, val url: String?, val email: String?,
                                                      val lat: Float?, val lon: Float?, val city: String?,
                                                      val openType: String, val hours: List<OpeningHours>,
                                                      val type: Int, val hasPickup: Boolean, val hasInPlace: Boolean)
