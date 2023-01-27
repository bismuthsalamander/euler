import kotlin.random.Random

class Problem151 {
    companion object {
        var output = HashMap<Pair<String, Int>, Double>()
        fun ArrayList<Int>.removePaper(i: Int, ct: Int = 1) {
            this[0] -= ct
            this[i] -= ct
        }

        fun ArrayList<Int>.addPaper(i: Int, ct: Int = 1) {
            this[0] += ct
            this[i] += ct
        }
        fun evalStatus(bag: ArrayList<Int>, day: Int): Double {
            if (bag[0] == 0) {
                return 0.0
            }
            var bagStr = bag.joinToString(",")
            val check = output[Pair(bagStr, day)]
            if (check != null) {
                return check
            }
            var bagSize = bag[0]
            var ev: Double = if (bagSize == 1) 1.0 else 0.0
            for (k in 1..5) {
                var v = bag[k]
                if (v == 0) {
                    continue
                }
                var myProb = v.toDouble() / bagSize.toDouble()
                //CHANGE BAG
                bag.removePaper(k)
                for (addIndex in k+1..5) {
                    bag.addPaper(addIndex)
                }
                //RECURSION
                ev += myProb * evalStatus(bag, day + 1)
                //CHANGE BAG BACK
                bag.addPaper(k)
                for (removeIndex in k+1..5) {
                    bag.removePaper(removeIndex)
                }
            }
            output[Pair(bagStr, day)] = ev
            return ev
        }

        fun solve() {
            var bag = arrayListOf(0, 0, 0, 0, 0, 0)
            bag.addPaper(1)
            println(evalStatus(bag, 1))
        }
        fun solveMC() {
            val trials = 100000000
            var totalSingles = 0L
            for (i in 0 until trials) {
                if (i % 1000000 == 0) {
                    println("trial $i")
                }
                totalSingles += runWeek().toLong()
            }
            println("$totalSingles / $trials = ${totalSingles.toDouble() / trials.toDouble()}")
        }

        fun runWeek(): Int {
            var singles = 0
            var bag = ArrayList<Int>()
            bag.add(1)
            for (i in 2..15) {
                if (bag.size == 1) {
                    singles++
                }
                if (i == 15) {
                    break
                }
                var paper = 0
                while (true) {
                    //println(bag)
                    paper = bag.removeAt(Random.nextInt(0, bag.size))
                    if (paper == 5) {
                        break
                    }
                    bag.add(paper + 1)
                    bag.add(paper + 1)
                }
            }
            return singles
        }
    }
}