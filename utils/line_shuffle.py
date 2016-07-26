#!/usr/bin/env python3

from random import randint
import argparse

parser = argparse.ArgumentParser(description="Shuffles a file's lines around")
parser.add_argument('infile', help='Input file to shuffle')
parser.add_argument('-o', '--outfile', help='Optional file to output to.')
args = parser.parse_args()

def shuffle(list):
    new_order = []
    for i in range(len(list)):
        current = list.pop(randint(0, len(list) - 1))
        new_order.append(current)
    return new_order

with open(args.infile, 'r+') as infile:
    lines = [line for line in infile.readlines()]
    newlines = shuffle(lines)

    if not args.outfile:
        infile.seek(0)
        [infile.write(line) for line in newlines]
        infile.truncate()
    elif args.outfile:
        with open(args.outfile, 'w') as outfile:
            [outfile.write(line) for line in newlines]


