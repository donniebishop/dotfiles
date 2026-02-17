#!/bin/bash

usage() {
  echo "Usage: $0 DIRECTORY"
  exit 1
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  usage
fi

if [ -z "$1" ]; then
  echo "[-] No directory provided."
  usage
fi

DIRECTORY="$1"

if [ ! -d "$DIRECTORY" ]; then
  echo "[-] Directory '$DIRECTORY' does not exist."
  exit 1
fi

zip -qre "${DIRECTORY}.zip" ./"$DIRECTORY"/

