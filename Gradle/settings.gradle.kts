rootProject.name = "learn-gradle"


val submodules = listOf("mo", "du", "le")
    .map { ":submodules:$it" }
    .toTypedArray()

include(":submodules", *submodules)