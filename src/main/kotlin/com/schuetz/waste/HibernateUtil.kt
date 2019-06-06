package com.schuetz.waste

import org.hibernate.Session
import org.hibernate.SessionFactory
import org.hibernate.Transaction
import org.hibernate.boot.MetadataSources
import org.hibernate.boot.registry.StandardServiceRegistry
import org.hibernate.boot.registry.StandardServiceRegistryBuilder
import org.slf4j.LoggerFactory

object HibernateUtil {
    private val log = LoggerFactory.getLogger(HibernateUtil::class.java)

    private var registry: StandardServiceRegistry? = null
    private var sessionFactory: SessionFactory? = null

    private fun getSessionFactory(): SessionFactory? = sessionFactory ?: {
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

    fun openSession(): Session? = getSessionFactory()?.openSession() ?: {
        log.error("Couldn't open a hibernate session.")
        null
    }()

    fun inTransaction(f: (Session) -> Unit) {
        val session = openSession() ?: return
        var transaction: Transaction? = null
        try {
            session.use {
                transaction = it.beginTransaction()
                f(it)
                transaction?.commit()
            }
        } catch (e: Exception) {
            e.printStackTrace()
            transaction?.rollback()
        }
    }

    fun shutdown() {
        registry?.let {
            StandardServiceRegistryBuilder.destroy(it)
        }
    }
}
