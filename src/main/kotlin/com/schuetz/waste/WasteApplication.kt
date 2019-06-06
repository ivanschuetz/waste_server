package com.schuetz.waste

import com.schuetz.waste.HibernateUtil.inTransaction
import com.schuetz.waste.HibernateUtil.openSession
import org.slf4j.LoggerFactory
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.CorsRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

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
}

fun main(args: Array<String>) {
    runApplication<WasteApplication>(*args)
}

/**
 * Enables CORS for localhost
 */
@Configuration
class MyConfiguration {
    @Bean
    fun corsConfigurer(): WebMvcConfigurer {
        return object : WebMvcConfigurer {
            override fun addCorsMappings(registry: CorsRegistry) {
                registry.addMapping("/**")
            }
        }
    }
}
