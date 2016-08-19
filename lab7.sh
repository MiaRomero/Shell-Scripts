#!/bin/bash

# lab7.sh

#Objective: Make a shell script that takes one argument and duplicates the functionality of the basename command using pattern matching.

#Desired Output:
# lab7.sh /home/bob/test.txt 
# test.txt



VAR1=$1

echo ${VAR1##*/}

exit


# if a user passes / to the script we dont want to return blank

#	BASEPATH="${VAR1##*/}"

#	if [[ -z "${BASEPATH}" ]] ; then
#		BASEPATH='/'
#	fi
#	echo "${BASEPATH}"
