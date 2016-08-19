#!/bin/bash

# lab2.sh

#Objective: Prompt the user for a number, ensure it's a number and check to see if it's an EVEN number

#Prompt the user to enter a number
#Make sure the input is a number
#Check the number to see if the number is even and output a message
#If it's odd output a different message
#Focus on proper formatting and readability
#Comment your code if necessary
 
#Items to use:

# conditional
# echo
# grep  or pattern matching?
# read


echo -n "Please enter a number: "
read INPUT

TESTNUMERIC=$(echo ${INPUT} | egrep '^-?[0-9]+$' | sed 's/^0*//')


if [[ ! -z ${TESTNUMERIC} ]]; then

	if [[ $((${TESTNUMERIC} % 2)) -eq 0 ]]; then
		echo "This number is even"
	else
		echo "This number is odd"
	fi
else
	echo "That is not a number"
fi


# ${INPUT} | sed 's/^[-+0]*//' | sed 's/\..*//g'

# check to see if $INPUT is an number by doing blind numeric comparison
# does not work for (( == )) or for [[ -eq ]] and ! has to be outside comparison
# if ! [ ${INPUT} -eq ${INPUT} ] &> /dev/null ; then  // checking the -eq (mathmatically equal) command for an error code
	#not a number

# if ! [[ -n "${INPUT}" && "${INPUT}" =~ ^[0-9]*$ ]] ; then   

# if ! (( 10#${INPUT} % 2 )) ; then  // 10# forces it to base ten number
