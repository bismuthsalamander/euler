public class Problem2 {
    companion object {
        fun solve() {
            var sum = 0
            val cap = 4000000
            var a = 0
            var b = 1
            while (b <= cap) {
                val c = a + b
                a = b
                b = c
                if (b % 2 == 0) {
                    sum += b
                }
            }
            println(sum)
        }
    }
}
