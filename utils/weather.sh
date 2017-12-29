#!/bin/bash

####################################################
# CREATION     : 2016-07-04
# MODIFICATION : 2016-07-08

# I3block's blocklet which:
# - Show current temperature
# - Show temperature for the next 3 days with a left click
# - Update temperature with a middle click

# Requirements:
# - curl
# - yad (For mouse interaction)
#
####################################################

city="ashburn"

declare -A state_icons=( \
	["Clear"]=""
	["Cloudy"]="" \
	["Fog"]="" \
	["Heavy_Rain"]="" \
	["Heavy_Showers"]="" \
	["Heavy_Snow"]="" \
	["Heavy_Snow_Showers"]="/" \
	["Light_Rain"]="" \
	["Light_Showers"]="" \
	["Light_Sleet"]="" \
	["Light_Sleet_Showers"]="" \
	["Light_Snow"]="" \
	["Light_Snow_Showers"]="" \
	["Partly_Cloudy"]="" \
	["Rain"]="" \
	["Sunny"]="" \
	["Thundery_Heavy_Rain"]="/" \
	["Thundery_Showers"]=""  \
	["Thundery_Snow_Showers"]="" \
	["Very_Cloudy"]="" \
	["generic"]="" \
)

getCurrWeather() {
	local datas=$(curl --silent "wttr.in/${city}" | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g")
	local head=$(echo "$datas" | head -n 7)
	local state=$(echo "$head" | head -n 3 | tail -n 1 | awk '{print $NF}')

	# for Celsius
	# local temperature=$(echo "$head" | grep -o "[0-9]*\ *°F")

	# for Freedom Units
	local temperature=$(echo "$head" | grep -o "[0-9]*\ *°F")

	echo "${state} ${temperature}"
}

# yad="yad --borders 0 --text-info --no-buttons --on-top --center --skip-taskbar --width 882 --height 622 --fontname Tewi 8 --back #1c1c20 --fore #e0e0df"
# case $BLOCK_BUTTON in
#     1) curl --silent "wttr.in/${city}" | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | $yad;;     # left click
#     2) pkill -RTMIN+2 i3blocks;;    # middle click
# esac

w=$(getCurrWeather)

state=$(echo "$w" | cut -d " " -f 1 | tr " " "_")
temp=$(echo "$w" | awk '{print $2 $3}')

if [[ "${!state_icons[*]}" =~ $state ]]; then
	icon=${state_icons[$state]}
else
	icon=${state_icons["generic"]}
fi

# echo "$icon $temp"
echo "$temp"
echo
