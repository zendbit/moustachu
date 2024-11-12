# Package

version     = "0.1.0"
author      = "Amru Rosyada"
description = "Mustache templating for Nim"
license     = "MIT"
srcDir      = "src"

# Dependencies

requires "nim >= 0.19.0"

# Tasks
task tests, "Run the nim_moustache tester":
  exec "nim compile --run runTests"

task benchmarks, "Run the nim_moustachu benchmarks":
  exec "nim compile --run runBenchmarks"
