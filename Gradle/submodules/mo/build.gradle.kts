dependencies {
    compile(kotlin("reflect"))      // This will go wrong when you run MainKt: Unresolved reference: 'compile'
                                            // It means that `apply { plugin("kotlin") }` doesn't work
}