inline class A<T>(val i: Any?): Runnable {
	override fun run() {
		println(i)
	}
}

fun main() {
	val i = foo()
	i.run()
	Thread(i)
}

fun foo(): A<Int> {
	return A(1)
}