package org.hoshino9.antlr

import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream

fun main() {
    val lexer = HoshinoLexer(CharStreams.fromString("""hello(hi(), 1, " 2 2 ", [1, "2", [3], hello(4)])"""))
    val tokenStream = CommonTokenStream(lexer)
    val parser = HoshinoParser(tokenStream)

    val call = parser.call()
    println(call.text)
    call.value().forEach {
        println(it.text)
    }
}