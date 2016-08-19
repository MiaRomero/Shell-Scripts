#!/bin/bash

# lab1.sh
# 4/14/15

#Objective: Prompt the user for a number and check to see if it's larger than 5

#Create a script called lab1.sh
#Prompt the user to enter a number
#Check the number to see if it's larger than 5 and output a message
#If it's not larger than 5 output a message
#Focus on proper formatting and readability
#Comment your code if necessary
 
#Items to use:
# conditional
# echo
# read

CONSTANT=5

echo -n "Please enter a number: "
read  NUMBER
if [[ "${NUMBER}" -gt "${CONSTANT}" ]]; then
	echo "Number is greater than "${CONSTANT}""
elif [[ "${NUMBER}" -eq ${CONSTANT} ]]; then
	echo "Number is equal to ${CONSTANT}"
else
	echo "Number is less than ${CONSTANT}"
fi


# 
