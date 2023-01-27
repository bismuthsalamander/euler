import java.net.URI
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.http.HttpResponse

class Problem8 {
    var numstr = ""
    val width = 13
    init {
        val response = Util.downloadProblem(8)
        var lines = response.split("\n")
        lines = Util.startWithNumbers(lines)
        lines = lines.map {
            it.substring(0, it.indexOf('<'))
        }
        numstr = lines.joinToString(separator="")
    }

    fun solve() {
        var best = 0L
        println(numstr)
        for (i in 0..numstr.length - width) {
            val sub = numstr.substring(i, i+width)
            val nums = sub.map{(it-'0').toLong()}
            val prod = nums.reduce(Long::times)
            if (prod > best || i == 88 || i == 195) {
                println("${i} ${sub} ${prod}")
                if (prod > best) best = prod
            }
            //println("digits: " + numstr.substring(i, i+width))
            //println("product: $prod best: $best")
        }
        println(best)
    }
}