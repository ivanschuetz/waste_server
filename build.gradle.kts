plugins {
	kotlin("jvm") version "1.9.25"
	kotlin("plugin.spring") version "1.9.25"
	id("org.springframework.boot") version "3.4.0"
	id("io.spring.dependency-management") version "1.1.6"
}

group = "com.example"
version = "0.0.1-SNAPSHOT"

java {
	toolchain {
		languageVersion = JavaLanguageVersion.of(17)
	}
}

repositories {
	mavenCentral()
	maven("https://repo.spring.io/snapshot")
	maven("https://repo.spring.io/milestone")
	maven("https://oss.sonatype.org/content/repositories/snapshots")
//	maven("https://raw.github.com/weddini/spring-boot-throttling/mvn-repo/")
}

dependencies {
	implementation("org.springframework.boot:spring-boot-starter-web")
	implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
	implementation("org.jetbrains.kotlin:kotlin-reflect")
	testImplementation("org.springframework.boot:spring-boot-starter-test")
	testImplementation("org.jetbrains.kotlin:kotlin-test-junit5")
	testRuntimeOnly("org.junit.platform:junit-platform-launcher")
	implementation("org.springframework:spring-jdbc")
	implementation("org.springframework.boot:spring-boot-starter-security")
	implementation("com.h2database:h2")
	implementation("mysql:mysql-connector-java:5.1.13")
	implementation("org.postgresql:postgresql")
	implementation("org.springframework.boot:spring-boot-starter-jdbc")
	implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
//	implementation("com.weddini.throttling:spring-boot-throttling-starter:0.0.9")
}

kotlin {
	compilerOptions {
		freeCompilerArgs.addAll("-Xjsr305=strict")
	}
}

tasks.withType<Test> {
	useJUnitPlatform()
}
