import com.google.gson.*
import com.google.gson.annotations.JsonAdapter
import org.intellij.lang.annotations.Language
import java.lang.reflect.Type

@Language("JSON") val source = """{
  "a": 1,
  "b": "2",
  "c": ["1", "2", "3"]
}"""

val gson = Gson()

@JsonAdapter(B.Deserializer::class)
data class B(val v: String) {
	object Deserializer : JsonDeserializer<B> {
		override fun deserialize(json: JsonElement?, typeOfT: Type?, context: JsonDeserializationContext?): B {
			return json?.asString?.run(::B) ?: throw JsonSyntaxException("")
		}
	}
}

data class Bean(val a: Int, val b: B, val c: List<B>)

fun main() {
	gson.fromJson(source, Bean::class.java).run(::println)
}