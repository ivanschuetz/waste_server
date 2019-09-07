package com.schuetz.waste.model

data class UpdateResult(val status: ResultStatus) {
    fun toDTO(): UpdateResultDTO = UpdateResultDTO(status.code)
}
