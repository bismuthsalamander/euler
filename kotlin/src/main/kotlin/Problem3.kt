class Problem3 {
    companion object {
        fun solve() {
            val input = 600851475143L;
            val f = Prime.factors(input)
            println(f[f.size - 1])
        }
    }
}