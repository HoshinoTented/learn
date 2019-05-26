plugins {
    kotlin("jvm") version "1.3.31"
}

repositories {
    jcenter()
}

allprojects {
    apply {
        plugin("kotlin")
    }

    group = "org.hoshino9"

    repositories {
        jcenter()
    }

    dependencies {
        compile(kotlin("stdlib"))
    }
}