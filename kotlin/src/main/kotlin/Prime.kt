import kotlin.math.ceil
import kotlin.math.sqrt

class Prime {
    companion object {
        var primes = ArrayList<Long>()
        init {
            primes.add(2)
            primes.add(3)
        }
        fun primesThrough(cap: Long) {
            while (primes[primes.size - 1] < cap) {
                var tester = primes[primes.size - 1] + 2
                while (!isPrime(tester)) {
                    tester += 2
                }
                primes.add(tester)
            }
        }

        fun isPrime(tester: Long): Boolean {
            return !(primes.any { tester % it == 0L })
        }

        fun factors(composite: Long): List<Long> {
            var c = composite
            var result = ArrayList<Long>()
            primesThrough(ceil(sqrt(c.toDouble())).toLong())
            for (p in primes) {
                while (c % p == 0L) {
                    result.add(p)
                    c /= p
                }
                if (c == 1L) {
                    break
                }
            }
            if (c == composite) {
                result.add(c)
            }
            return result
        }

        fun factorsMap(p: Long): Map<Long, Int> = listToCountMap(factors(p))
        fun listToCountMap(primes: List<Long>): Map<Long, Int> {
            var res = HashMap<Long, Int>()
            for (p in primes) {
                res[p] = (res[p] ?: 0) + 1
            }
            return res
        }
    }
}