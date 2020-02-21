# Package

version       = "0.1.0"
author        = "John Novak <john@johnnovak.net>"
description   = "Nim wrapper for the osdialog library"
license       = "WTFPL"

skipDirs = @["examples"]


# Dependencies

requires "nim >= 1.0.6"

task examples, "Compiles the examples":
  exec "nim c examples/test.nim"
