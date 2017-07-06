#!/bin/bash

UPDATES=$(checkupdates | wc -l)
[ "$UPDATES" -gt 0 ] && echo " $UPDATES"
