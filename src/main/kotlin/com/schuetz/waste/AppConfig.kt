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
    fun publicContainerDao(): PublicContainerDao = PublicContainerDao()

    @Bean
    fun pickupCompaniesContainerDao(): PickupCompaniesDao = PickupCompaniesDao()

    @Bean
    fun objectMapper() = ObjectMapper().apply {
        registerModule(KotlinModule())
        propertyNamingStrategy = MyPropertyNamingStrategy()
    }
}
