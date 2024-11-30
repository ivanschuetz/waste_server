package com.schuetz.waste

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.registerKotlinModule
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class AppConfig {
    @Bean
    fun itemDao(): ItemSuggestionsDao = ItemSuggestionsDao()

    @Bean
    fun containerDao(): ContainerDao = ContainerDao()

    @Bean
    fun recipientsDao(): CategoryRecipientsDao = CategoryRecipientsDao()

    @Bean
    fun itemRecipientsDao(): ItemRecipientsDao = ItemRecipientsDao()

    @Bean
    fun itemSearchDao(): ItemSearchDao = ItemSearchDao()

    @Bean
    fun categoryDao(): CategoryDao = CategoryDao()

    @Bean
    fun itemTipDao(): ItemTipDao = ItemTipDao()

    @Bean
    fun categoryTipDao(): CategoryTipDao = CategoryTipDao()

    @Bean
    fun recipientDao(): RecipientDao = RecipientDao()

    @Bean
    fun objectMapper() = ObjectMapper().apply {
        registerKotlinModule()
        propertyNamingStrategy = MyPropertyNamingStrategy()
    }
}
