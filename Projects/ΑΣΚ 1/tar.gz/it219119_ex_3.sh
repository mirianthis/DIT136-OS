#!/bin/bash

#if command to make sure the user give the right parameters if not it exits
if [ "$#" -ne 1 ]
then
	echo "Give 1 directory parameter to run the script"
	exit 1
fi

#If statement to check if its a directory
if [ -d "$1" ]
then
#Use the du command to find the disk usage of the directory that the user gives
#I use the redirect to make the errors go to null directory
#I use a pipe to sort the spaces and then the head to show only the first 5 lines
du -sh "$1"/* 2>/dev/null | sort -rh | head -5 

else
	echo "The parameter you gave is not a directory"
	exit 1
fi
