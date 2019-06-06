package com.schuetz.waste

import javax.persistence.Column
import javax.persistence.Entity

@Entity
class Item(
    @Column(nullable = false)
    val name: String? = null

) : AbstractJpaPersistable<Long>() {
    override fun toString() = super.toString() + ", name: $name"
}
