#!/bin/bash

#echo "Please enter your name"
#read NAME

#echo "Your name is ${NAME}" 

SCRIPTNAME=${0}
NAME=${1}

echo ${SCRIPTNAME}
echo ${NAME}
#echo ${2}

if test ${NAME} = bob ; then
	echo "Hello bob"
else
	echo "Hello someone else"
fi

if [[ ${NAME} = bob ]] ; then
	echo "Hello bob"
else 
	echo "Hello someone else"
fi

#can write the "then" on the next line as below
if grep root /etc/passwd 
then
	echo "root exists"
fi

NUMBER=4

FINAL=$(( 4 + 4 ))
echo ${FINAL}

(( NUMBER++ ))
echo ${NUMBER}

