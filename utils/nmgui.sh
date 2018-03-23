#!/bin/bash
nm-applet 2> /dev/null &
stalonetray 2> /dev/null
killall nm-applet
