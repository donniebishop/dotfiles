#!/usr/bin/env sh

# i'm so sick and tired of mediaanlaysisd turning my laptop
# into a space heater, and needing to manually kill it via
# Activity Monitor every few days

ps -ef | grep -q -e "mediaanalysisd$"
MAD_RUNNING=$?

# look what you made me do 
if [ "$MAD_RUNNING" -eq 0 ]; then
  MAD_PROC=$(pgrep -f "mediaanalysisd$")
  #echo "mediaanalysisd running ($MAD_PROC). Killing process..."
  kill -15 $MAD_PROC
else
  #echo "mediaanlysisd not running. Exiting."
  exit 0
fi

