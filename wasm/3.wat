(module
  ;;(memory 10 100)
  (import "host" "print" (func $print (param i32)))
  (func $largestFac (param $composite i32) (result i32)
    (local $f i32)
    (local.set $f (i32.const 2))
    (loop $removeTwos
      (i32.rem_u (local.get $composite) (local.get $f))
      (if (then)
        (else
          (local.set $composite (i32.div (local.get $composite) 2))
          br $removeTwos
        )
      )
    )
    (local.set $f (i32.add (local.set $f) (i32.const 1)))
  
    ;;loop that returns i32  
  )
  (func $testit (result i32) i32.const 600851475143 call $largestFac)
  (export "testit" (func $testit))
)
