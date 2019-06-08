package com.schuetz.waste

import java.util.Objects
import javax.persistence.Column
import javax.persistence.EmbeddedId
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.ManyToOne
import javax.persistence.MapsId
import javax.persistence.Table

@Entity(name = "ItemContainer")
@Table(name = "item_container")
class ItemContainer(
    @EmbeddedId
    var id: ItemContainerId,

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("item_id")
    var item: Item? = null,

    @MapsId("container_id")
    @ManyToOne(fetch = FetchType.LAZY)
    var container: Container? = null,

    @Column(name = "prio")
    var prio: Int? = null
) {

    override fun equals(other: Any?): Boolean {
        if (this === other) return true

        if (other == null || javaClass != other.javaClass)
            return false

        val that = other as? ItemContainer ?: return false
        return Objects.equals(item, that.item) && Objects.equals(container, that.container)
    }

    override fun hashCode(): Int {
        return Objects.hash(item, container)
    }
}
