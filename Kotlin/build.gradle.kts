import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

val kotlinVersion = "1.3.20"

group = "com.github.HoshinoTented"
version = "1.0"

plugins {
	kotlin("jvm") version "1.3.20"
}

repositories {
	jcenter()
	maven("https://jitpack.io")
}

dependencies {
	implementation(kotlin("reflect", kotlinVersion))
	implementation(kotlin("stdlib", kotlinVersion))
	implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.1.1")
	testImplementation(kotlin("test-junit", kotlinVersion))
}

tasks.withType<KotlinCompile> {
	kotlinOptions.jvmTarget = "1.8"
}