#!/bin/bash

#if command to check if the user gives a parameter and if its a directory
if [ "$#" -ne 1 ] || ! [ -d "$1" ]
then
	echo "You must give one directory"
	exit 1
fi

#The commands to find the files of the directory and if i can read them 
#Then i print the files into a txt file
ls -l "$1" | grep ^-r.....r | awk '{print $9}' >> files.txt

#While loop to find the lines and characters of every file and then get the average
while read -r i; do

	lines=$(cat "$1"/"$i"|wc -l)		#Save all the lines of a file
	chars=$(cat "$1"/"$i" | wc -m)		#Save all the characters of a file

	if [ "$lines" == 0 ]			#if to see if the file has any lines
	then
		echo "$i:File has 0 lines cant do division"
	else
	avg_line_size=$(( "$chars" / "$lines" ))		#The division to find the average
	echo "$i $avg_line_size"			#Print the name of the file and the avg
	fi

done <files.txt
rm files.txt		#remove the txt file i created

