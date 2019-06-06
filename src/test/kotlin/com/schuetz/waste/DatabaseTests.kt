package com.schuetz.waste

import org.hibernate.cfg.Configuration
import org.hibernate.testing.junit4.BaseCoreFunctionalTestCase
import org.hibernate.testing.transaction.TransactionUtil.doInHibernate
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.IOException
import java.util.Properties

class DatabaseTests : BaseCoreFunctionalTestCase() {

    private val properties: Properties
        @Throws(IOException::class)
        get() {
            val properties = Properties()
            properties.load(javaClass.classLoader.getResourceAsStream("hibernate.properties"))
            return properties
        }

    override fun configure(configuration: Configuration?) {
        super.configure(configuration)
        configuration?.properties = properties
    }

    override fun getAnnotatedClasses(): Array<Class<*>> = arrayOf(Item::class.java)

    @Test
    fun mockDatabaseWorks() {
        doInHibernate(({ this.sessionFactory() }), { session ->
            val itemToSave = Item("Orange")
            session.persist(itemToSave)
            val itemFound = session.get(Item::class.java, itemToSave.getId())
            println("itemFound: $itemFound")

            // TODO very strange - if refresh the session without doing the query first, we get this error:
            // TODO org.hibernate.UnresolvableObjectException: No row with the given identifier exists: [this instance does not yet exist as a row in the database#1]
            // TODO apparently a timing issue? No idea how this works, since either way we see in the output before (println("itemFound: $itemFound"))
            // TODO that the item was found in the database, so why refresh can't see it? And why does is start working if query the table first?
//            val query: Query<*> = session.createQuery("from Item")
//            println("query result: ${query.resultList}")
//            session.refresh(itemFound)

            assertTrue(itemToSave == itemFound)
        })
    }
}
