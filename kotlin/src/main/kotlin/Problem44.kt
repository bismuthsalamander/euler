class Problem44 {
    companion object {
        var maxIndex = 0
        var pens = HashSet<Int>()
        init {
            addPens(20000)
        }
        fun addPens(n: Int) {
            for (i in 0 until n) {
                maxIndex++
                pens.add(pen(maxIndex))
            }
        }
        fun pen(n: Int): Int {
            return n * (3*n - 1) / 2
        }

        fun isPen(n: Int): Boolean {
            return pens.contains(n)
        }
        fun solve() {
            var best = 0
            for (i in 1..5000) {
                for (j in i+1..5000) {
                    val pi = pen(i)
                    val pj = pen(j)
                    if (!isPen(pi + pj) || !isPen(pj - pi)) {
                        continue
                    }
                    val diff = pj - pi
                    best = if (diff < best || best == 0) diff else best
                }
            }
            println(best)
        }
    }
}