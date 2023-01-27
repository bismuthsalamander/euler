import java.net.URI
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.http.HttpResponse

class Util {
    companion object {
        fun downloadProblem(i: Int, strip: Boolean = true): String {
            val url = "https://projecteuler.net/minimal=$i"
            val client = HttpClient.newBuilder().build()
            val req = HttpRequest.newBuilder().uri(URI.create(url)).build()
            var out = client.send(req, HttpResponse.BodyHandlers.ofString()).body()
            println(out)
            if (strip) {
                out = stripHtml(out)
            }
            return out
        }

        fun startWithNumbers(lines: List<String>): List<String> = lines.filter {
            it.isNotEmpty() && it[0] in '0'..'9'
        }

        fun stripHtml(html: String): String {
            return html.replace(Regex("<.*?>"), "")
        }
    }
}