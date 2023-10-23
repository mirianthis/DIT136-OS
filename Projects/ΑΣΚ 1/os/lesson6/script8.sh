#!/bin/bash

print_help(){
	echo "Usage $0 filename"
}

if [ $# -ne 1 ] 
then
	print_help
	exit 1
fi

cnt=0
echo -n "" > zygos
echo -n "" > monos

while read line
do
	((cnt++))
	echo "$cnt: $line"
	if [ $(expr $cnt % 2) -eq 0 ] #zigos 
	then
		echo "$cnt: $line" >> zygos
	else 
		echo "$cnt: $line" >> monos
	fi

done < $1
