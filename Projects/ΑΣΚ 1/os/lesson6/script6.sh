#!/bin/bash
trap 'rm tmpfile; echo ignoring signal 2' 2

touch tmpfile
sleep 20
echo "Finish"
