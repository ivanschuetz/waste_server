package com.schuetz.waste

import com.schuetz.waste.HibernateUtil.openSession

class ContainerDao {
    fun containers(itemId: Long): List<Container> =
        openSession()
        ?.createQuery("from Item where id = :id", Item::class.java)
        ?.setParameter("id", itemId)
        ?.uniqueResult()
        ?.let { it.containers.sortedBy { it.prio }.mapNotNull { it.container } }
        ?: emptyList()
}
