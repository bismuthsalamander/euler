(module
  (func $isThree (param i32) (result i32)
    local.get 0
    i32.const 3
    i32.rem_u
    i32.const 0
    i32.eq
  )
  (func $isFive (param i32) (result i32)
    local.get 0
    i32.const 5
    i32.rem_u
    i32.const 0
    i32.eq
  )
  (func $isEither (param i32) (result i32)
    i32.const 0
    local.get 0
    call $isThree
    i32.add
    local.get 0
    call $isFive
    i32.add
  )
  (func $isEitherFast (param i32) (result i32)
    local.get 0
    call $isThree
    (if
      (then
        i32.const 1
        return
      )
    )
    local.get 0
    call $isFive
  )
  (func $isEitherFaster (param i32) (result i32)
    local.get 0
    i32.const 3
    i32.rem_u
    (if (result i32)
      (then
        local.get 0
        i32.const 5
        i32.rem_u
        i32.const 0
        i32.eq
        return
      )
      (else
        i32.const 1
        return
      )
    )
  )
  (func $fbSum (param $max i32) (result i32)
    (local $sum i32)
    (local $i i32)
    i32.const 0
    local.set $sum
    i32.const 1
    local.set $i
    (loop $numloop
      local.get $i
      call $isEitherFaster
      i32.const 0
      i32.ne

      (if
        (then
          local.get $sum
          local.get $i
          i32.add
          local.set $sum
        )
      )
      local.get $i
      i32.const 1
      i32.add
      local.set $i
      local.get $i
      local.get $max
      i32.lt_u
      br_if $numloop
    )
    local.get $sum
  )
  (func $testit (result i32) i32.const 1000 call $fbSum)
  (export "testit" (func $testit))
)
