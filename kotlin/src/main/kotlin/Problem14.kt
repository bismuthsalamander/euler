class Problem14 {
    companion object {
        val cap = 1000000
        var results = HashMap<Long, Long>()

        fun next(n: Long): Long {
            return if (n % 2 == 0L) n / 2 else 3 * n + 1
        }

        fun countSteps(n: Long): Long {
            if (n == 1L) {
                return 1
            }
            var result = results[n] ?: 0L
            if (result != 0L) {
                return result
            }
            result = countSteps(next(n)) + 1
            results[n] = result
            return result
        }
        fun solve() {
            var longest = 0L
            var winner = 0L
            for (i in 1L until cap) {
                var len = countSteps(i)
                if (len > longest) {
                    longest = len
                    winner = i
                }
            }
            println("$winner has $longest steps")
        }
    }
}