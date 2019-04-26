#!/bin/bash

# megamenu: a menu of system information and various terminal baffoonery.

declare -a menuarray=('Update Terminal' 'Display Disk Space' 'Display System Information' 'Get Network (local) IP Address' 'Path Includes' 'Week of the Year' 'When is Easter?' 'Watch Star Wars Instead' 'Quit');

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
		0)	xdg-open https://www.d3c3p7.com 2>/dev/null || open https://www.d3c3p7.com
			;;
		1)	sudo apt update; sudo apt upgrade -y
			;;
		2)	df -h
			echo ""
			;;
		3)	echo " Hostname: $HOSTNAME"
			echo ""
			uptime
			echo ""
			;;
		4)	echo "I know where you are:"
			echo ""
			dig +short myip.opendns.com @resolver1.opendns.com
			echo ""
			;;
		5)	echo "Weak human, this is your \$PATH:"
			echo ""
			echo -e ${PATH//:/\\n}
			echo ""
			;;	
		6)	echo "The week is... "
			echo ""
			date +%V
			echo ""
			;;
		7)	echo "This year's Easter is on "
			echo ""
			ncal -e
			echo ""
			;;
		8)	nc towel.blinkenlights.nl 23
			;;	
		9)	arr[0]="Humans don't deserve to live!"
			arr[1]="You fail me yet again, Starscream. GET THEM!"
			arr[2]="Is it fear or courage that compels you, fleshling?"
			arr[3]="Give me the Allspark, and you may live to be my pet."
			rand=$(( RANDOM % 4 ))
			echo "${arr[$rand]}"
			echo ""
			break
			;;
		*)	echo "Megacron has labeled $USER as Invalid" >&2
			echo ""
			exit 1
			;;
	esac
done