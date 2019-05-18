package org.hoshino9.antlr

import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.tree.TerminalNode

fun main() {
    val lexer = StringLexer(CharStreams.fromString(""""\nqwq\\\n""""))
    val tokenS = CommonTokenStream(lexer)
    val parser = StringParser(tokenS)

    val fullString = parser.string()

    fullString.children.forEach {
        if (it is TerminalNode) {
            it.symbol.tokenIndex.run(::println)
        }
    }
}