#!/usr/bin/env python3

""" Takes the output of `colors` and formats the list of hex values into an
Xresources-formatted text file. Automatically sets the variables `termbg` and
`termfg` to the first and last hex strings received. """

import sys

# read colors from stdin
hexes = [color.strip("\n") for color in sys.stdin.readlines()]
bg, fg = hexes[0], hexes[-1]

# Print colors 0-15
for (index, color) in enumerate(hexes):
    print("*.color{}: {}".format(index, color))

# set termbg and termfg
print("\n#define termbg {}".format(bg))
print("#define termfg {}\n".format(fg))
