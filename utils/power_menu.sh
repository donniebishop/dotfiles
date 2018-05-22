#!/bin/bash
 
res=$(echo "lock|logout|reboot|shutdown" | rofi -sep "|" -dmenu -i -p 'Power Menu: ' "" -width 9 -hide-scrollbar -eh 4 -location 5 -yoffset -26 -padding 12 -opacity 100 -font "Tewi 9" -auto-select -no-fullscreen) 
 
if [ $res = "lock" ]; then
    /usr/local/bin/lock.sh
fi
if [ $res = "logout" ]; then
    i3-msg exit
fi
if [ $res = "reboot" ]; then
    systemctl reboot
fi
if [ $res = "shutdown" ]; then
    systemctl poweroff
fi
exit 0
