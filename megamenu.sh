#!/bin/bash

# megamenu: a menu of system information and various terminal abilities.

clear
echo "
Please Select:

0. Quit
1. Update Terminal
2. Display Disk Space
3. Display System Information
"
read -p "Enter selection [0-3] > "

case $REPLY in
	0)	echo "Program terminated."
		exit
		;;
	1)	sudo apt update; sudo apt upgrade -y
		;;
	2)	df -h
		;;
	3)	echo "Hostname: $HOSTNAME"
		uptime
		;;
	*)	echo "Megacron has labeled you as Invalid" >&2
		exit 1
		;;
esac