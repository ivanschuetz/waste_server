package com.schuetz.waste

import org.hibernate.SessionFactory
import org.hibernate.boot.MetadataSources
import org.hibernate.boot.registry.StandardServiceRegistry
import org.hibernate.boot.registry.StandardServiceRegistryBuilder

object HibernateUtil {
    private var registry: StandardServiceRegistry? = null
    private var sessionFactory: SessionFactory? = null

    fun getSessionFactory(): SessionFactory? = sessionFactory ?: {
        try {
            val registry = StandardServiceRegistryBuilder().configure().build()
            val sources = MetadataSources(registry)
            val metadata = sources.metadataBuilder.build()
            val sessionFactory = metadata.sessionFactoryBuilder.build()

            this.registry = registry
            this.sessionFactory = sessionFactory

            sessionFactory

        } catch (e: Exception) {
            e.printStackTrace()
            registry?.let {
                StandardServiceRegistryBuilder.destroy(it)
            }
            null
        }
    }()

    fun shutdown() {
        registry?.let {
            StandardServiceRegistryBuilder.destroy(it)
        }
    }
}
