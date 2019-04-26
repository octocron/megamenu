#!/bin/bash

# megamenu: a menu of system information and various terminal baffoonery.

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
		4)	echo "I know where you are:"
			dig +short myip.opendns.com @resolver1.opendns.com
			;;
		5)	echo "Weak human, this is your \$PATH:"
			echo -e ${PATH//:/\\n}
			;;	
		6)	echo "The week is... "
			date +%V
			;;
		7)	echo "This year's Easter is on "
			ncal -e
			;;
		8)	nc towel.blinkenlights.nl 23
			;;	
		9)	arr[0]="Humans don't deserve to live!"
			arr[1]="You fail me yet again, Starscream. GET THEM!"
			arr[2]="Is it fear or courage that compels you, fleshling?"
			arr[3]="Give me the Allspark, and you may live to be my pet."
			rand=$(( RANDOM % 4 ))
			echo "${arr[$rand]}"
			break
			;;
		*)	echo "Megacron has labeled $USER as Invalid" >&2
			exit 1
			;;
	esac
done