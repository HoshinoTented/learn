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

    repositories {
        jcenter()
    }

    dependencies {
        compile(kotlin("stdlib"))
    }
}