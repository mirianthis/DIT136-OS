#!/bin/bash
set -e
if [ $# -ne 2 ]
then
	echo "Usage: not enough arguments"
fi
y=0
while read -r x
do
	if [ $y -eq "$1" ]
	then
		break
	fi
	((y++))
	echo "$y: $x"
done < "$2"
