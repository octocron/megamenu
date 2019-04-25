#!/bin/bash

# megamenu: a menu of system information and various terminal abilities.

saveIFS="$IFS"
IFS=$'\n'
read -d '' -a menuarray < ./menu
IFS="$saveIFS"

for (( i=0; i<${#menuarray[@]}; i++ ))
do
	menu=$menu"$(($i+1))) ${menuarray[i]}"$'\n'
done

while [[ 1 ]]
do
	echo "$menu"
	read -p "Enter Selection, $USER [1-9] > "
	clear
	case $REPLY in
		1)	sudo apt update; sudo apt upgrade -y
			;;
		2)	df -h
			;;
		3)	echo "Hostname: $HOSTNAME"
			uptime
			;;
		4)	echo "Your IP is:"
			dig +short myip.opendns.com @resolver1.opendns.com
			;;
		5)	echo "These are included in your \$PATH:"
			echo -e ${PATH//:/\\n}
			;;	
		6)	echo "The week is... "
			date +%V
			;;
		7)	echo "The next Easter will be "
			ncal -e
			;;
		8)	nc towel.blinkenlights.nl 23
			;;	
		9)	echo "Humans don't deserve to live!"
			break
			;;
		*)	echo "Megacron has labeled $USER as Invalid" >&2
			exit 1
			;;
	esac
done