#!/bin/bash
 
res=$(echo " logout| restart| shutdown" | rofi -sep "|" -dmenu -i -p "" -bw 0 -bc "#dc1900" -bg "#1e1e20" -fg "#e0d8d1" -hlbg "#1e1e20" -hlfg "#dc1900" -separator-style none -width 9 -hide-scrollbar -location 3 -padding 30 -opacity 100 -line-margin 5 -font "Hack 10")
 
#if [ $res = "lock" ]; then
#    /home/khoaduccao/.config/lock.sh
#fi
if [ $res = " logout" ]; then
    i3-msg exit
fi
if [ $res = " restart" ]; then
    systemctl reboot
fi
if [ $res = " shutdown" ]; then
    systemctl poweroff
fi
exit 0
