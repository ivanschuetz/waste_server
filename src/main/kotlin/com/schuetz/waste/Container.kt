package com.schuetz.waste

import javax.persistence.Column
import javax.persistence.Entity

@Entity
class Container(
    @Column(nullable = false)
    val name: String? = null,

    @Column(nullable = false)
    val color: String? = null

) : AbstractJpaPersistable<Long>() {
    override fun toString() = super.toString() + ", name: $name, color: $color"
}
