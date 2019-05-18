import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    java
    kotlin("jvm") version "1.3.31"
}

group = "org.hoshino9"
version = "1.0-SNAPSHOT"

sourceSets {
    main.configure {
        java.srcDirs("src/main/gen")
//        java.srcDirs("gen")
    }
}

repositories {
    jcenter()
}

dependencies {
    implementation(group = "org.antlr", name = "antlr4", version = "4.7.2")
    implementation(kotlin("stdlib-jdk8"))
    testCompile("junit", "junit", "4.12")
}

configure<JavaPluginConvention> {
    sourceCompatibility = JavaVersion.VERSION_1_8
}

tasks.withType<KotlinCompile> {
    kotlinOptions.jvmTarget = "1.8"
}

task<JavaExec>("genAntlr") {
    classpath = sourceSets.main.get().runtimeClasspath
    main = "org.hoshino9.antlr.Generate"
    args(project.properties["grammar"] ?: "Hoshino")
}