package org.hoshino9.gradle.learn

import org.gradle.api.Plugin
import org.gradle.api.Project

class HoshinoPlugin : Plugin<Project> {
    override fun apply(project: Project) {
        val hoshino = project.extensions.create("hoshino", HoshinoPluginExtension::class.java)
        val hoshi = project.extensions.create("hoshi", HoshinoPluginExtension::class.java)

        project.run {
            task("whoCute") {
                it.doLast {
                    hoshino.message.run(::println)
                    hoshi.message.run(::println)
                }
            }
        }
    }
}