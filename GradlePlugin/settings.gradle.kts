rootProject.name = "gradle-plugin"

include(":test")

pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
    }
}