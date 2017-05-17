#!/usr/bin/env python3

from random import randint
import argparse

parser = argparse.ArgumentParser(description="Shuffles a file's lines around")
parser.add_argument('infile', help='Input file to shuffle')
parser.add_argument('-o', '--outfile', help='Optional file to output to.')
args = parser.parse_args()

def shuffle(alist):
    # Apparently this is a near optimal implemenation of the Fisher-Yates
    # shuffle! Neat!
    return [alist.pop(randint(0, len(alist)-1)) for i in range(len(alist))]

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

