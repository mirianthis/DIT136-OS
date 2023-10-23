#!/bin/bash

a=$(df / | awk 'FNR==2 {print $5}') #I use df to find the percent thats used from the filesystem and awk get the percent
if [ "$a" \< "90%" ]	#if command to check if its below 90%
then
	echo """$a"" of your / filesystem is used. Ok!" #Prints message
else
	echo """$a"" of your / filesystem is used. Delete some files!!!" #Prints message 
fi
