import org.hoshino9.gradle.learn.HoshinoPluginExtension
import org.hoshino9.gradle.learn.HoshinoCuteTask

buildscript {
    repositories {
        mavenLocal()
    }

    dependencies {
        classpath("org.hoshino9.gradle.plugins:gradle-plugin:1.0")
    }
}

apply(plugin = "org.hoshino9.gradle.learn")

//plugins {
//    id("org.hoshino9.gradle.learn") version "1.0"
//}

configure<HoshinoPluginExtension> {
    message = "Hoshino is very very cute!!!"
}

println("use extensions")

val hoshi: HoshinoPluginExtension by extensions         // extensions is better

hoshi.message = "Hoshino love hoshino"

tasks.register<HoshinoCuteTask>("hoshinoCute") {

}