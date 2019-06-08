package com.schuetz.waste

import java.io.Serializable
import java.util.Objects
import javax.persistence.Column
import javax.persistence.Embeddable

@Embeddable
class ItemContainerId(
    @Column(name = "item_id")
    private val itemId: Long?,

    @Column(name = "container_id")
    private val containerId: Long?

): Serializable {

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || javaClass != other.javaClass)
            return false
        val that = other as? ItemContainerId ?: return false
        return Objects.equals(itemId, that.itemId) && Objects.equals(containerId, that.containerId)
    }

    override fun hashCode(): Int {
        return Objects.hash(itemId, containerId)
    }
}
