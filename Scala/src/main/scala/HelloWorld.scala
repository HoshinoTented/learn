object HelloWorld {
	def main(args : Array[String]): Unit = {
		println("Hello world!")

		val range = 1 until 10

		for (x <- range) {
			println(x)
		}
	}
}
