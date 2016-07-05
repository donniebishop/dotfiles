#!/bin/bash

UPDATES=$(checkupdates | wc -l)

if [ "$UPDATES" > 0 ]; then
    exit 0
else
    echo "  $UPDATES"
fi
