import java.math.BigInteger

class Problem5 {
    companion object {
        fun solve() {
            var primeMaps = ArrayList<Map<Long, Int>>()
            for (i in 2L..20) {
                primeMaps.add(Prime.factorsMap(i))
            }
            var answerMap = HashMap<Long, Int>()
            for (m in primeMaps) {
                m.forEach { (p, e) ->
                    if ((answerMap[p] ?: 0) < e) {
                        answerMap[p] = e
                    }
                }
            }
            var result = 1L
            //see https://stackoverflow.com/a/58619613
            answerMap.forEach { (p, e) -> result *= BigInteger.valueOf(p).pow(e).toLong() }
            println(result)
        }
    }
}