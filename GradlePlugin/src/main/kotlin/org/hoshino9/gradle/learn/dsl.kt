package org.hoshino9.gradle.learn

import org.gradle.api.Project
import org.gradle.api.plugins.ExtensionAware

fun Project.hoshino(configuration: HoshinoPluginExtension.() -> Unit) {
    (this as ExtensionAware).extensions.configure("hoshino", configuration)
}