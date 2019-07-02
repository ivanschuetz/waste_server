package com.schuetz.waste

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.KotlinModule
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class AppConfig {
    @Bean
    fun itemDao(): ItemSuggestionsDao = ItemSuggestionsDao()

    @Bean
    fun containerDao(): ContainerDao = ContainerDao()

    @Bean
    fun recipientsDao(): RecipientsDao = RecipientsDao()

    @Bean
    fun itemSearchDao(): ItemSearchDao = ItemSearchDao()

    @Bean
    fun categoryDao(): CategoryDao = CategoryDao()

    @Bean
    fun tipDao(): TipDao = TipDao()

    @Bean
    fun objectMapper() = ObjectMapper().apply {
        registerModule(KotlinModule())
        propertyNamingStrategy = MyPropertyNamingStrategy()
    }
}
