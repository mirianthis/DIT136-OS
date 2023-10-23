#!/bin/bash

#I put the command to find my ip address a
a=$(dig +short myip.opendns.com @resolver1.opendns.com)
#I use curl to go to ipinfo and find my isp
#Then i use grep and sed to get my isp provider
b=$( curl -s ipinfo.io | grep  org | sed 's/.*://') 
# I show my ip to the user be calling a and my isp by calling b
echo "My ip is $a and my ISP is $b"
