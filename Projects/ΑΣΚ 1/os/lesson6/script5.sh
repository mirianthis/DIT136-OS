#!/bin/bash

echo "Which operating system do you use?:"
select os in Ubuntu Mint Debian Windows7 Windows8 Windows10 Mac
do
	case $os in
		"Ubuntu" | "Debian" | "Mint" )
			echo "I also use $os ..!"
			;;
		Windows*)
			echo "Why don't you try Linux..?"
			;;
		"Mac")
			echo "You must be very,Rich..!"
			;;
		*)
			echo "Invalid option. Program will exit now."
			break
			;;
		esac
done
