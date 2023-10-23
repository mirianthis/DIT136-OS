#!/bin/bash

#if command to make sure the user give the right parameters if  not it exits
if [ "$#" -ne 2 ]
then
	echo "You must give 2 parameters the time and the area"
	exit 1
fi

LC_TIME=en_US.utf8	#A command to make the language of the date command in english

time="$1"	#Save the time that the user gives

b=$(TZ="$2" date --date='TZ="Europe/Athens" '"$time"'') #Finds the date and time of another timezone and saves it in b

echo "Time in $2 is $b" #Prints the country and the timezone

