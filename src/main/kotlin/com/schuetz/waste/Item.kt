package com.schuetz.waste

import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType.EAGER
import javax.persistence.OneToMany
import javax.persistence.Table

@Entity(name = "Item")
@Table(name = "item")
class Item(
    @Column(nullable = false)
    var name: String = "",

//    @OneToMany(mappedBy = "item", cascade = [CascadeType.ALL], orphanRemoval = true, fetch = LAZY)
    @OneToMany(mappedBy = "item", cascade = [CascadeType.ALL], fetch = EAGER, targetEntity = ItemContainer::class)
    var containers: List<ItemContainer> = emptyList()

) : AbstractJpaPersistable<Long>() {
    override fun toString() = super.toString() + ", name: $name"
}
