# nim-osdialog

*Nim wrapper for the C [osdialog](https://github.com/AndrewBelt/osdialog)
library*

## Installation

**nim-osdialog** can be installed via Nimble:

    nimble install osdialog

## Usage

Have a look at `test.nim` in the [examples](/examples) directory. You can
build the examples by executing the following command:

    nimble examples

## Notes

Only the file dialog related functionality has been wrapped as the rest (color
picker, alert boxes) does not work on OS X.

## License

osdialog is released into the public domain (CC0).

The wrapper is released under the [Do What The Fuck You Want To Public
License, Version 2](http://www.wtfpl.net/), as published by Sam Hocevar.

