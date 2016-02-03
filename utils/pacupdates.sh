#!/usr/bin/env bash

if [[ $(checkupdates | wc -l) > 0 ]]
then
    notify-send "System update" "$(checkupdates | wc -l) updates available."
fi
 
