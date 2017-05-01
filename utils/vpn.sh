#!/bin/bash

IFACE=wlp2s0

function getInets(){
	/usr/bin/ip addr show $1 | grep -c "inet "
}

function getUID(){
	id -u
}

function up(){
	if [ $(getUID) != 0 ] ; then
		echo "Must be root to bring VPN up!"
		exit 1
	else
		/usr/bin/ipsec up algo
	fi
}

function down(){
	if [ $(getUID) != 0 ] ; then
		echo "Must be root to bring VPN down!"
		exit 1
	else
		/usr/bin/ipsec down algo
	fi
}

function status(){
	if [[ $(getInets $IFACE) -eq 2 ]] ; then
		echo "Enabled"
	else
		echo ""
	fi
}


if [ $# = 1 ] ; then
	$1
else
	status
fi
