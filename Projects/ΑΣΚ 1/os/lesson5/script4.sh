#!/bin/bash
if [ $# != 1 ]
then
	echo "Usage: $0 filename"
	exit 1
fi

if [ ! -f "$1" ]
then
	echo "The file $1 does not exit"
	exit 2
fi

if [ ! -w "$1" ]
then
	echo "You have not write access to file $1"
	exit 2
fi

read -rp "Do you want to remove this file: Yes/No:" a
if [[ "$a" =~ y|Y|YES|yes ]]
then
	rm "$1"
	echo "file $1 removed" 
else 
	echo "file $1 not removed"
	exit 2
fi
