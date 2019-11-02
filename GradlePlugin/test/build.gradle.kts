import groovy.lang.Closure
import org.gradle.util.Configurable
import org.hoshino9.gradle.learn.HoshinoPluginExtension
import org.hoshino9.gradle.learn.HoshinoCuteTask

buildscript {
    repositories {
        mavenLocal()
    }

    dependencies {
        classpath("org.hoshino9.gradle.plugins:hoshino-plugin:1.0")
    }
}

apply(plugin = "org.hoshino9.learn.gradle.plugin")

//plugins {
//    id("org.hoshino9.learn") version "1.0"
//}

extensions.configure<HoshinoPluginExtension>("hoshino") {
    message = "Hoshino is very very cute!!!"
}

//val hoshi: HoshinoPluginExtension by extensions         // extensions is better
//
//hoshi.message = "Hoshino love hoshino"

tasks.register<HoshinoCuteTask>("hoshinoCute") {
    
}