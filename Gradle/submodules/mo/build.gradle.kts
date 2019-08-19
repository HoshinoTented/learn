dependencies {
    compile(kotlin("reflect"))      // This will go wrong when you run `:submodules:mo:build`: Unresolved reference: 'compile'
                                            // It means that `apply { plugin("kotlin") }` doesn't work
}