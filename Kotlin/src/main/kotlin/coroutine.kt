import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.async
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking


fun main() {
	var timer = GlobalScope.async { delay(3000) }
	runBlocking {
		println("Into block")
		timer.await()
		println("Reset getTimer")
		timer = GlobalScope.async { delay(3000) }
		println("End of block")
	}

	println("Finished")
}