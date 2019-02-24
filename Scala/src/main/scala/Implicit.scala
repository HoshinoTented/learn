object Implicit {
	implicit val intTuple: (Int, (Int, Int) => Int) = (0, (a, b) => {a + b})
	implicit val strTuple: (String, (String, String) => String) = ("str", (a, b) => {a + b})

	def foo[A](x: A)(implicit t: (A, (A, A) => A)): A = {
		val (v, f) = t

		f(v, x)
	}

	def main(args: Array[String]): Unit = {
		println(foo(1))
		println(foo("ing"))
	}
}
