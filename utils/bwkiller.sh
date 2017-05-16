#!/bin/bash

#Script to remove the annoyingly persistent Bitwig Studio directory
#that's created on opening Bitwig every single time. Runs on a cron job

BWDIR=/home/dbishop/Bitwig\ Studio

if [ -d "$BWDIR" ]; then
    rm -rf "$BWDIR"
fi
