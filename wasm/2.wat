(module
  (import "host" "print" (func $print (param i32)))
  (func $fibSum (param $max i32) (result i32)
    (local $a i32)
    (local $b i32)
    (local $sum i32)
    i32.const 1
    i32.const 1
    i32.const 0
    local.set $sum
    local.set $b
    local.set $a
    (loop $theloop
      local.get $b
      local.get $b
      local.get $a
      i32.add
      local.set $b
      local.set $a

      local.get $b
      local.get $max
      i32.le_u
      (if
        (then
          local.get $b
          i32.const 2
          i32.rem_u
          (if (then)
            (else
              local.get $b
              local.get $sum
              i32.add
              local.set $sum
            )
          )
          br $theloop
        )
      )
    )
    local.get $sum
  )
  (func $testit (result i32) i32.const 4000000 call $fibSum)
  (export "testit" (func $testit))
)
