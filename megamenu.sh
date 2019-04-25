#!/bin/bash

# megamenu: a menu of system information and various terminal abilities.

saveIFS="$IFS"
IFS=$'\n'
read -d '' -a menuarray < menu
IFS="$saveIFS"

for (( i=0; i<${#menuarray[@]}; i++ ))
do
	menu=$menu"$(($i+1))) ${menuarray[i]}"$'\n'
done

while [[ 1 ]]
do
	echo "$menu"
	read -p "Enter # Selection $> "
	#clear
	case $REPLY in
		1)	sudo apt update; sudo apt upgrade -y
			;;
		2)	df -h
			;;
		3)	echo "Hostname: $HOSTNAME"
			uptime
			;;
		4)	echo "Humans don't deserve to live!"
			break
			;;
		*)	echo "Megacron has labeled you as Invalid" >&2
			exit 1
			;;
	esac
done