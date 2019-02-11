fun main() {
	val seq = sequence {
		while (true) yield(5)
	}

	val oldSeq = Sequence {
		object : Iterator<Int> {
			override fun hasNext() : Boolean {
				return true
			}

			override fun next() : Int {
				return 5
			}
		}
	}

	println(seq.take(5).toList() == oldSeq.take(5).toList())
}