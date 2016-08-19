#!/bin/bash

# lab9.sh

#Objective: Create a script that parses commandline arguments and options.

#Create a script named lab9.sh
#The script should take these options
# -d - turns on debugging (set -x)
# -v - sets the VERBOSE variable to true
# -h - prints out a help message with the name of the script (and no path information) plus the options
# -n <name> - takes a name argument and prints a message on the screen
# -l <dir> - have it list the directory using a for loop or ls (ask yes/no before proceeding)
#any other options - prints the help message and exits
#Puts all additional arguments in $1 $2 etc.

HELPMESSAGE="Help menu for"

HELPOPTIONS="\r\nOptions for this script: \r\n
		 -d : turns on debugging \r\n
		 -v : sets VERBOSE to true \r\n
		 -h : prints out the help menu \r\n
		 -n : takes a name argument & prints a message \r\n
		 -l : lists content of current directory (must enter y or n) \r\n
		 any other option : prints help menu and exits"

SCRIPTNAME=${0#*/}

while getopts :dvhln: opt ; do   #first colon turns off error messages, second one means "n" requires an argument
	case $opt in 

		d) set -x ;; #sets debugging on

		v) VERBOSE="true" ;; #echo ${VERBOSE};;

		h) echo -e "${HELPMESSAGE} ${SCRIPTNAME} ${HELPOPTIONS}";; #help menu

		l) echo "Would you like to list everything in this directory? Y or N" ; #lists directory
			read RESPONSE ; 
			if [[ ${RESPONSE} = Y ]]; then
				ls -1
			else
				exit
			fi;;

		n) NAME=${OPTARG} ; echo "Hi ${NAME}!";; #takes in name, prints message

		*) echo -e "${HELPMESSAGE} ${SCRIPTNAME} ${HELPOPTIONS}" ; exit;; #help, exit  // could do h|*) to combine them
	esac
done

shift $(($OPTIND -1))  #reset variable position after options

COUNT=1
for param in ${@}; do
	echo "VAR ${COUNT}: ${param}" #displays all variables
	((COUNT++))
done
exit


# case "${RESPONSE}" in 
#	[yY][eE][sS]|[yY])
#		ls -l
#	;;
#	[nN][oO]|[nN])
#		exit 1  // exits with a return code of 1
#	;;
#	*)  echo "unrecognized answer"
#		exit 1
#	;;
# esac
