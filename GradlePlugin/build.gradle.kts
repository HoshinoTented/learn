import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    maven
    `java-gradle-plugin`

    id("com.typelead.eta") version "0.8.1"
    id("com.gradle.plugin-publish") version "0.10.0"
    kotlin("jvm") version "1.3.41"
}

group = "org.hoshino9.gradle.plugins"
version = "1.0"

eta {
    setVersion("0.8.6b5")
    setEtlasVersion("1.5.0.0")
    setPreInstallDependencies(true)
}

pluginBundle {
    plugins {
        create("hoshinoPlugin") {
            id = "org.hoshio9.learn.gradle.plugin"
            description = "Test Plugin"
            displayName =  "Hoshino Plugin"
            version = project.version.toString()
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