import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
	kotlin("jvm") version "1.3.31"
	id("org.springframework.boot") version "2.1.5.RELEASE" apply true
	id("io.spring.dependency-management") version "1.0.7.RELEASE" apply true
	kotlin("plugin.spring") version "1.3.31" apply true
}

group = "com.schuetz"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_1_8

repositories {
	mavenCentral()
    maven("https://repo.spring.io/snapshot")
    maven("https://repo.spring.io/milestone")
    maven("https://oss.sonatype.org/content/repositories/snapshots")
}

springBoot {
	mainClassName = "com.schuetz.waste.WasteApplicationKt"
}

dependencies {
	implementation("org.springframework.boot:spring-boot-starter")
	implementation("org.jetbrains.kotlin:kotlin-reflect")
	implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")

    implementation("org.springframework.boot:spring-boot-starter-web")
	implementation("org.springframework.boot:spring-boot-starter-jetty")
	implementation("org.springframework.boot:spring-boot-starter-actuator")
	implementation("org.springframework:spring-jdbc")
	compile("org.springframework.boot:spring-boot-starter-security")
	implementation("com.h2database:h2")
	implementation("mysql:mysql-connector-java")
	implementation("org.postgresql:postgresql")
	implementation("org.springframework.boot:spring-boot-starter-jdbc")
    implementation("com.fasterxml.jackson.module:jackson-module-kotlin")

    testImplementation("org.springframework.boot:spring-boot-starter-test")
    testImplementation("com.h2database:h2")
}

tasks.withType<KotlinCompile> {
	kotlinOptions {
		freeCompilerArgs = listOf("-Xjsr305=strict")
		jvmTarget = "1.8"
	}
}
