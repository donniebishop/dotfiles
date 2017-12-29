#!/usr/bin/sh

FCITXSTATUS=$(/usr/bin/fcitx-remote)
[ $FCITXSTATUS -eq 2 ] && echo "何"
