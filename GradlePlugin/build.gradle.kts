import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    maven
    `java-gradle-plugin`
    id("com.gradle.plugin-publish") version "0.10.0"
    kotlin("jvm") version "1.3.41"
}

group = "org.hoshino9.gradle.plugins"
version = "1.0"

gradlePlugin {
    plugins {
        create("hoshino") {
            id = "org.hoshino9.gradle.learn"
            implementationClass = "org.hoshino9.gradle.learn.HoshinoPlugin"
        }
    }
}

repositories {
    maven("https://maven.aliyun.com/repository/public")
    mavenCentral()
}

dependencies {
    compile(gradleApi())
    implementation(kotlin("stdlib-jdk8"))
}

tasks.withType<KotlinCompile> {
    kotlinOptions.jvmTarget = "1.8"
}