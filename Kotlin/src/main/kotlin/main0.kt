inline fun <T, reified S> foo(x : T?, y : T) : T {
	return if (x is S) x else y
}

fun main(args : Array<String>) {
	repeat(100) {}
	println(foo<String, String?>(null, "qwq").toString())
}