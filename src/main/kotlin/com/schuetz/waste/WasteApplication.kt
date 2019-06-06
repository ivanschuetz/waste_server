package com.schuetz.waste

import org.hibernate.Transaction
import org.slf4j.LoggerFactory
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.jdbc.core.JdbcTemplate


@SpringBootApplication
class WasteApplication(val jdbcTemplate: JdbcTemplate) : CommandLineRunner {

    private val log = LoggerFactory.getLogger(WasteApplication::class.java)

    override fun run(vararg args: String?) {
        val student = Item("Apples")
        var transaction: Transaction? = null
        try {
            HibernateUtil.getSessionFactory()!!.openSession().use { session ->
                // start a transaction
                transaction = session.beginTransaction()
                // save the student objects
                session.save(student)
                // commit transaction
                transaction!!.commit()
            }
        } catch (e: Exception) {
            e.printStackTrace()
//            if (transaction != null) {
//                transaction!!.rollback()
//            }
        }

        val session = HibernateUtil.getSessionFactory()?.openSession()
        val items = session?.createQuery("from Item", Item::class.java)?.list()
        items?.forEach {
//            it.name.length
            println("item: $it")
            println("item! ${it.getId()}, ${it.name}")
        }

//        log.info("Creating tables")
//        jdbcTemplate.execute("DROP TABLE customers IF EXISTS")
//        jdbcTemplate.execute("CREATE TABLE customers(" + "id SERIAL, first_name VARCHAR(255), last_name VARCHAR(255))")
//
//        // Split up the array of whole names into an array of first/last names
//        val splitUpNames: List<Pair<String, String>> = listOf("John Woo", "Jeff Dean", "Josh Block", "Josh Long")
//                .map { name -> name.split(" ") }
//                .map { split -> split[0] to split[1] }
//
//        // Use a Java 8 stream to print out each tuple of the list
//        splitUpNames.forEach { name -> log.info(String.format("Inserting customer record for %s %s", name.first, name.second)) }
//
//        // Uses JdbcTemplate's batchUpdate operation to bulk load data
//        jdbcTemplate.batchUpdate("INSERT INTO customers(first_name, last_name) VALUES (?, ?)", splitUpNames, splitUpNames.size) { ps, (firstName, lastName) ->
//            ps.setString(1, firstName)
//            ps.setString(2, lastName)
//        }
//
//        log.info("Querying for customer records where first_name = 'Josh':")
//        jdbcTemplate.query(
//                "SELECT id, first_name, last_name FROM customers WHERE first_name = ?", arrayOf<Any>("Josh")
//        ) { rs, _ -> Customer(rs.getLong("id"), rs.getString("first_name"), rs.getString("last_name")) }.forEach { customer -> log.info(customer.toString()) }
    }
}

fun main(args: Array<String>) {
    runApplication<WasteApplication>(*args)
}
