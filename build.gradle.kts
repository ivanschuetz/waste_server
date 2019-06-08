import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
	kotlin("jvm") version "1.3.31"
	id("org.springframework.boot") version "2.1.5.RELEASE" apply true
	id("io.spring.dependency-management") version "1.0.7.RELEASE" apply true
    id("org.jetbrains.kotlin.plugin.noarg") version "1.3.31" apply true
    id("org.jetbrains.kotlin.plugin.allopen") version "1.3.31" apply true
    id("org.jetbrains.kotlin.plugin.jpa") version "1.3.31" apply true
	kotlin("plugin.spring") version "1.3.31" apply true
}

//
//// https://spring.io/blog/2016/12/16/dependency-management-plugin-1-0-0-rc1
//dependencyManagement {
//    imports {
//        mavenBom("org.springframework.boot:spring-boot-parent:$2.1.5.RELEASE")
//    }
//}
//
//noArg {
//    annotation("javax.persistence.Entity")
//}

allOpen {
    annotation("javax.persistence.Entity")
    annotation("javax.persistence.MappedSuperclass")
    annotation("javax.persistence.Embeddable")
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

dependencies {
	implementation("org.springframework.boot:spring-boot-starter")
	implementation("org.jetbrains.kotlin:kotlin-reflect")
	implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")

    implementation("org.springframework.boot:spring-boot-starter-web")
	implementation("org.springframework.boot:spring-boot-starter-jetty")
	implementation("org.springframework.boot:spring-boot-starter-actuator")
	implementation("org.springframework:spring-jdbc")
	implementation("com.h2database:h2")
	implementation("mysql:mysql-connector-java")
	implementation("org.postgresql:postgresql")
	implementation("org.springframework.boot:spring-boot-starter-data-jpa")
    implementation("com.fasterxml.jackson.module:jackson-module-kotlin")

    testImplementation("org.springframework.boot:spring-boot-starter-test")
    testImplementation("org.hibernate:hibernate-testing")
    testImplementation("com.h2database:h2")
}

tasks.withType<KotlinCompile> {
	kotlinOptions {
		freeCompilerArgs = listOf("-Xjsr305=strict")
		jvmTarget = "1.8"
	}
}
