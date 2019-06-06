package com.schuetz.waste

import org.hibernate.Session
import org.hibernate.Transaction
import org.slf4j.LoggerFactory
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class WasteApplication : CommandLineRunner {
    private val log = LoggerFactory.getLogger(WasteApplication::class.java)

    override fun run(vararg args: String?) {
        testDatabase()
    }

    private fun testDatabase() {
        inTransaction { session ->
            session.save(Item("Apples"))
        }

        val items = openSession()?.createQuery("from Item", Item::class.java)?.list()
        items?.forEach {
            log.info("item: $it")
        }
    }

    fun openSession(): Session? = HibernateUtil.getSessionFactory()?.openSession() ?: {
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
}

fun main(args: Array<String>) {
    runApplication<WasteApplication>(*args)
}
