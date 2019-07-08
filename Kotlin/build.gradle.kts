import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

buildscript {
	repositories {
		maven("http://maven.aliyun.com/nexus/content/groups/public/")
		jcenter()
	}

	dependencies {
		classpath(kotlin("gradle-plugin", version = "1.3.40"))
	}
}

plugins {
	kotlin("jvm") version "1.3.40"
}

val arrow_version = "0.9.0"

repositories {
	maven("http://maven.aliyun.com/nexus/content/groups/public/")
}

dependencies {
	compile("io.arrow-kt:arrow-core-data:$arrow_version")
	compile("io.arrow-kt:arrow-core-extensions:$arrow_version")
	compile("io.arrow-kt:arrow-syntax:$arrow_version")
	compile("io.arrow-kt:arrow-typeclasses:$arrow_version")
	compile("io.arrow-kt:arrow-extras-data:$arrow_version")
	compile("io.arrow-kt:arrow-extras-extensions:$arrow_version")
	compile("io.arrow-kt:arrow-effects-data:$arrow_version")
	compile("io.arrow-kt:arrow-effects-io-extensions:$arrow_version")
	compile("com.google.code.gson", "gson", "2.8.5")

	implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.1.1")
	testImplementation(kotlin("test-junit"))
}

tasks.withType<KotlinCompile> {
	kotlinOptions.jvmTarget = "1.8"
}