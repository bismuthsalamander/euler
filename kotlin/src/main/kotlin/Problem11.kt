class Problem11 {
    companion object {
        var grid: List<List<Int>> = ArrayList<ArrayList<Int>>()
        init {
            var out = Util.downloadProblem(11)
            println(out )
            var lines = Util.startWithNumbers(out.split("\n"))
            grid = lines.map {
                it.split(" ").map {
                    it.toInt()
                }
            }
        }
        fun List<Int>.gridGet(i: Int): Int {
            return this.getOrElse(i) { 0 }
        }
        fun List<List<Int>>.gridGet(i: Int, j: Int): Int {
            return this.getOrNull(i)?.gridGet(j) ?: 0
        }

        fun makeProduct(r: Int, c: Int, dr: Int, dc: Int, n: Int): Int {
            var product = 1
            for (i in 0 until n) {
                product *= grid.gridGet(r + (dr*i), c + (dc*i))
            }
            return product
        }
        fun solve() {
            var best = 0
            val N = 4
            for (r in grid.indices) {
                for (c in grid[0].indices) {
                    var p = makeProduct(r, c, 0, 1, N)
                    best = if (p > best) p else best
                    p = makeProduct(r, c, 1, 0, N)
                    best = if (p > best) p else best
                    p = makeProduct(r, c, 1, 1, N)
                    best = if (p > best) p else best
                    p = makeProduct(r, c, -1, 1, N)
                    best = if (p > best) p else best
                }
            }
            println(best)
        }
    }
}