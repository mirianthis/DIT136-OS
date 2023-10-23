#!/bin/bash
if [ $# -eq 3 ]
then
	if [ $2 == "+" ]
	then
		let g=$1+$3 
		echo $g
	else 
		let g=$1-$3
		echo $g
	fi
else 
	$echo"Please give number operator number"
fi


