#!/usr/bin/bash

wat2wasm $1 -o a.out; wasm-interp a.out --run-all-export --host-print
