package com.schuetz.waste

import org.springframework.data.util.ProxyUtils
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.MappedSuperclass

@MappedSuperclass
abstract class AbstractJpaPersistable<T : java.io.Serializable> {

    @Id
    @GeneratedValue
    private var id: T? = null

    fun getId(): T? = id

    override fun equals(other: Any?): Boolean {
        other ?: return false
        if (this === other) return true
        if (javaClass != ProxyUtils.getUserClass(other)) return false
        other as AbstractJpaPersistable<*>
        return if (null == this.id) false else this.id == other.id
    }

    override fun hashCode(): Int {
        return 31
    }

    override fun toString() = "Entity of type ${this.javaClass.name} with id: $id"

    companion object {
        private val serialVersionUID = -5554308939380869754L
    }
}
