#!/bin/bash
# Prints the terminal colors in a line
# Only works with terminals that use .Xdefaults/.Xresources
#
# Created by Dylan Araps
# https://github.com/dylanaraps/dotfiles
# Edited by fullsalvo

number="0"

echo

# This echo is outside of the for loop to manually set it's text color

regular() {

    for color in $( xrdb -query | awk '/*color[1-8]:/ {print $2}' ); do
	echo -n "$(tput setaf "$number")$(tput smso)          $(tput sgr0)"
	number=$((number+1))
    done

    echo
    echo

}

bold() {

    for color in $( xrdb -query | awk '/*color[1-8]:/ {print $2}' ); do
	echo -n "$(tput setaf "$number")$(tput smso)          $(tput sgr0)"
        number=$((number + 1))
    done

    echo

    for color in $( xrdb -query | awk '/*color[1-8]:/ {print $2}' ); do
	echo -n "$(tput setaf "$number")$(tput smso)          $(tput sgr0)"
        number=$((number + 1))
    done

    echo
    echo

}

usage() {
    echo "blocks"
    echo "    -b: include bold"
}

case $1 in
    -b)
	bold
	;;
    -h)
	usage
	;;
    *)
	regular
	;;
esac

