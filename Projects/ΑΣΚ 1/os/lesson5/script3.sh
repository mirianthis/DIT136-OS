#!/bin/bash

echo "Arguments: $#"
echo "Arguments: $*"
if [ $# -ne 3 ]
then
	echo "Usage: $0 number operator number"
	exit 1
fi

if [[ "$2" =~ [+-/] ]]
then
	if [ "$2" == "x" ]
	then
		echo $(expr "$1" \* " "$3")
	else
		echo $(expr "$1" "$2" "$3")
fi
else echo "Usage: $0  number operator number"
fi

