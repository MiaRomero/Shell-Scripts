#!/bin/bash

while [ ! -z $1 ]; do
	echo "Arg is $1"
	shift
done


# run this script as ./shift.sh *
# this will do the script on everything in current directory. In this case it willlist all the files.
