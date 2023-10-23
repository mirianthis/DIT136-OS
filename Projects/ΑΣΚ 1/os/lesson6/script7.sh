#!/bin/bash

print_help(){
	echo "Usage $0 path"
	}

if [ $# -ne 1 ]
then
	print_help
fi

check_file() {
[ -d "$1" ] && echo "$1 is directory"
[ -f "$1" ] && echo "$1 is file"
[ -x "$1" ] && echo "$1 is executable file"
[ -L "$1" ] && echo "$1 is symbolic link"
	}
check_file $1
