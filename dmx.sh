#!/bin/bash

if [[ $1 =~ '-h' ]]; then
	echo "Display a Matrix(ish) screen in the terminal"
	echo "Usage:		matrix [SPACING [SCROLL]]"
	echo "Example:	matrix 100 0"
	exit 0
fi


clear
tput cup 0 0
while :
	do for i in $(eval echo {1..$screenlines})
		do for i in $(eval echo {1..$screencols})
			do rand=$(($RANDOM%$spacing))
				case $rand in
					0)
						printf "${colors[$RANDOM%$colorcount]}${chars[$RANDOM%$count]} "
						;;
					1)
						printf "  "
						;;
					*)
						printf "\033[2C"
						;;
				esac
			done
			printf "\n"

			# sleep .005
		done
		tput cup 0 0
	done
