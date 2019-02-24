trait A {
	val a: Option[Int]
}

trait B {
	this: A =>
	def b(): Option[Int] = {
		a.map(_ + 1)
	}
}

class C extends A with B {
	override val a: Option[Int] = Option.apply(5)
}

class Trait {

}

object Trait {
	def main(args: Array[String]): Unit = {
		println((new C).b())
	}
}