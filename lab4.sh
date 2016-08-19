#!/bin/bash

# lab4.sh

#Objective: Use logical ANDs and ORs in conditions to simplify your code. Prompt the user for a number, sanitize the input (eg make sure the input is an integer) and using a logical AND ensure it's between 50 and 100.  Do this with ONE if conditional. 

#Prompt the user for an integer
#Ensure it's an integer
#Check to see if it's in the desired range (50-100)
#Let the user know if it's a success 

VAR1=50
VAR2=100

echo -n "Please enter a number: "
read INPUT

NUMBER=$(echo ${INPUT} | egrep '^-?[0-9]+$')

LENGTH=$(echo ${#NUMBER}) 

if [[ ${LENGTH} -gt 0 ]]; then
	NUMBER=$(echo ${NUMBER} | sed 's/^0*//' | sed 's/^-0\{1,\}/-/')
else
	echo 'That is not a number'
	exit 
fi
 
if [[ ${VAR1} -le ${NUMBER} && ${NUMBER} -le ${VAR2} ]]; then
	echo 'This number is between 50 and 100'
else
	echo 'This number is NOT between 50 and 100'
fi

exit 


# 
