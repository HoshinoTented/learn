package org.hoshino9.gradle

import org.gradle.api.DefaultTask
import org.gradle.api.tasks.TaskAction

open class HoshinoTask : DefaultTask() {
	@TaskAction
	fun doIt() {
		project.rootProject
				.project(":SubProject")
				.name
				.run(::println)
	}
}