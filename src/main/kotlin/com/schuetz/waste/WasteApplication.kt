package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.autoconfigure.security.SecurityProperties
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.http.HttpMethod
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.core.userdetails.User
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.security.provisioning.InMemoryUserDetailsManager
import org.springframework.security.web.SecurityFilterChain
import org.springframework.web.cors.CorsConfiguration
import org.springframework.web.cors.CorsConfigurationSource
import org.springframework.web.cors.UrlBasedCorsConfigurationSource

@SpringBootApplication
class WasteApplication : CommandLineRunner {
    override fun run(vararg args: String?) {}
}

fun main(args: Array<String>) {
    runApplication<WasteApplication>(*args)
}

@Configuration
@EnableWebSecurity
class WebSecurityConfig {

    @Bean
    fun securityFilterChain(http: HttpSecurity): SecurityFilterChain {
        http
            .cors { it.configurationSource(corsConfigurationSource()) }
            .authorizeHttpRequests { auth ->
                auth
                    .requestMatchers("/securityNone").permitAll()
                    .requestMatchers(HttpMethod.POST, "/**").permitAll()
                    .anyRequest().authenticated()
            }
            .httpBasic { }
            .csrf { it.disable() }

        return http.build()
    }

    @Bean
    fun corsConfigurationSource(): CorsConfigurationSource {
        val configuration = CorsConfiguration().apply {
            allowCredentials = true
            allowedOrigins = listOf(
                "https://wohin-mit.de",
                "http://localhost:3000"
            )
            allowedMethods = listOf("GET", "POST")
            allowedHeaders = listOf("*")
        }

        val source = UrlBasedCorsConfigurationSource()
        source.registerCorsConfiguration("/**", configuration)
        return source
    }

    @Bean
    fun passwordEncoder(): PasswordEncoder {
        return BCryptPasswordEncoder()
    }

    @Bean
    fun inMemoryUserDetailsManager(passwordEncoder: PasswordEncoder): InMemoryUserDetailsManager {
        val user = User.withUsername("wohinmit")
            .password(passwordEncoder.encode("set582Ax9upK3QqB6"))
            .roles("USER")
            .build()
        return InMemoryUserDetailsManager(user)
    }
}
