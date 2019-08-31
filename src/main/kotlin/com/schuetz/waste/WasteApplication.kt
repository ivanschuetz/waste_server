package com.schuetz.waste

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.http.HttpMethod
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.web.cors.CorsConfiguration
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
class WebSecurityConfig : WebSecurityConfigurerAdapter() {

    @Autowired
    @Throws(Exception::class)
    fun configureGlobal(auth: AuthenticationManagerBuilder) {
        auth.inMemoryAuthentication()
            .withUser("wohinmit").password(passwordEncoder().encode("set582Ax9upK3QqB6"))
            .authorities("ROLE_USER")
    }

    @Throws(Exception::class)
    override fun configure(http: HttpSecurity) {
        // Allows everyhing
//        http.cors().configurationSource {
//            CorsConfiguration().applyPermitDefaultValues()
//        }

        http.cors().configurationSource {
            CorsConfiguration().apply {
                allowCredentials = true
                allowedOrigins = listOf(
                    "https://wohin-mit.de",
                    "http://localhost:3000"
                )
                allowedMethods = listOf("GET", "POST")
                addAllowedHeader("*") // Not sure why this is needed, but without cors doesn't work (OPTIONS returns 403) (at least for localhost)
                val source = UrlBasedCorsConfigurationSource()
                source.registerCorsConfiguration("/**", this)
            }
        }

        http.authorizeRequests()
            .antMatchers("/securityNone").permitAll()
            .antMatchers(HttpMethod.POST, "/**").permitAll()
            .anyRequest().authenticated()
            .and()
            .httpBasic()
            .and().csrf().disable() // This is needed for POST requests to work, otherwise 403
    }

    @Bean
    fun passwordEncoder(): PasswordEncoder {
        return BCryptPasswordEncoder()
    }
}
