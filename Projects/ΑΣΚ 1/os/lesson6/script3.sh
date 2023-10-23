#!/bin/bash

if [ $# != 1 ]
then
	echo "Usage: $0 filename"
	exit 1
fi

read -p "Do you want to remove file $1?:" ans

case $ans in
	y|Y|YES|yes|Yes)
		rm $1 && echo "File $1  was removed"
		;;
	n|N|NO|No)
		echo "File $1 not removed"
		;;
	*)
		echo "Not acceptable answer"
		;;
esac
