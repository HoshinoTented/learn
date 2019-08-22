package org.hoshino9.gradle.learn

import org.gradle.api.DefaultTask
import org.gradle.api.tasks.TaskAction

open class HoshinoCuteTask : DefaultTask(), Runnable {
    @TaskAction
    override fun run() {
        println("Hoshino is cute!!!!!!!!!!!!!!!!!!!")
    }
}