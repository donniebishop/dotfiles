#!/bin/bash

UPDATES=$(checkupdates | wc -l)

if [ "$UPDATES" > 0 ]; then
    sleep 180
else
    echo "  $UPDATES"
fi
