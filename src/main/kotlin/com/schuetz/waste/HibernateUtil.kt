package com.schuetz.waste

import org.hibernate.SessionFactory
import org.hibernate.boot.MetadataSources
import org.hibernate.boot.registry.StandardServiceRegistry
import org.hibernate.boot.registry.StandardServiceRegistryBuilder

object HibernateUtil {
    private var registry: StandardServiceRegistry? = null
    private var sessionFactory: SessionFactory? = null

    fun getSessionFactory(): SessionFactory? {
        if (sessionFactory == null) {
            try {
                // Create registry
                val registry = StandardServiceRegistryBuilder().configure().build()
                // Create MetadataSources
                val sources = MetadataSources(registry)
                // Create Metadata
                val metadata = sources.metadataBuilder.build()
                // Create SessionFactory
                sessionFactory = metadata.sessionFactoryBuilder.build()

                this.registry = registry

            } catch (e: Exception) {
                e.printStackTrace()
                if (registry != null) {
                    StandardServiceRegistryBuilder.destroy(registry)
                }
            }

        }
        return sessionFactory
    }

    fun shutdown() {
        if (registry != null) {
            StandardServiceRegistryBuilder.destroy(registry)
        }
    }
}
