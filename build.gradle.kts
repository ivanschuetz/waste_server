import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
	id("org.springframework.boot") version "2.1.5.RELEASE"
	id("io.spring.dependency-management") version "1.0.7.RELEASE"
	kotlin("jvm") version "1.2.71"
	kotlin("plugin.spring") version "1.2.71"
}

group = "com.schuetz"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_1_8

repositories {
	mavenCentral()
}

dependencies {
	implementation("org.springframework.boot:spring-boot-starter")
	implementation("org.jetbrains.kotlin:kotlin-reflect")
	implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")

	implementation("org.springframework.boot:spring-boot-starter-web")
	implementation("org.springframework.boot:spring-boot-starter-jetty")
	implementation("org.springframework.boot:spring-boot-starter-actuator")
	implementation("org.springframework:spring-jdbc")
	implementation("com.h2database:h2")

//    compile("org.springframework.boot:spring-boot-starter-web") {
//        exclude module: "spring-boot-starter-tomcat"
//    }
//    compile "org.springframework.boot:spring-boot-starter-jetty"
//    compile "org.springframework.boot:spring-boot-starter-actuator"


//    implementation("org.springframework.boot:spring-boot-gradle-plugin:1.5.2.RELEASE")
//    classpath "org.jetbrains.kotlin:kotlin-allopen:$kotlin_version"
//    classpath "org.springframework.boot:spring-boot-gradle-plugin:1.5.2.RELEASE"

    testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<KotlinCompile> {
	kotlinOptions {
		freeCompilerArgs = listOf("-Xjsr305=strict")
		jvmTarget = "1.8"
	}
}
