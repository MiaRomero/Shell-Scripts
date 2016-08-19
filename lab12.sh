#!/bin/bash

# lab12.sh

#Objective: Create a script with a pseudo multi-dimensional array
#Create a script that:
#Reads in /var/share/CS225/addresses.csv and parses the various parts into separate arrays
#Loops through resulting arrays and prints data back onto the screen in the same format as addresses.csv
#When you get done you should have an array for each column and each item number should correspond to a row.
#Print the results back out by iterating through the NUMBER of rows (get from one of the arrays ${#LNAME[@]}).

#Script has to include the following
#trap for control-c
#uses pattern substitution
#uses arrays

cleanUp(){
	exit
}

trap "echo ' You have chosen to stop this script' ; cleanUp" SIGINT

HELPMESSAGE="\r\nHelp menu for"

HELPOPTIONS="\r\nOptions for this script: \r\n
		 -d : turns on debugging \r\n
		 -h : prints out the help menu \r\n
		 any other option : prints help menu and exits"

SCRIPTNAME=${0#*/}

ADDRESSES="/var/share/CS225/addresses.csv"

printHelpMenu(){
	echo -e "${HELPMESSAGE} ${SCRIPTNAME} ${HELPOPTIONS} \r\n"
}

while getopts :dh optionChosen ; do
	case "${optionChosen}" in

		d) set -x ;; 

		h) printHelpMenu ; cleanUp ;;

		*) printHelpMenu; cleanUp ;;
	esac
done

IFS=$'\n' #change delimiter to hard return

COUNTER=0

#fill in arrays by parsing each ITEM
for ITEM in $(tail -n +2  ${ADDRESSES} | sed 's/","/>/g' | sed 's/"//g') ; do 

	  FNAME[${COUNTER}]="${ITEM%%>*}"	;   	ITEM="${ITEM#*>}"
	  LNAME[${COUNTER}]="${ITEM%%>*}"   	;   	ITEM="${ITEM#*>}"
	COMPANY[${COUNTER}]="${ITEM%%>*}" 	;   	ITEM="${ITEM#*>}"
	 STREET[${COUNTER}]="${ITEM%%>*}" 	;    	ITEM="${ITEM#*>}"
	   CITY[${COUNTER}]="${ITEM%%>*}" 	;      	ITEM="${ITEM#*>}"
	 COUNTY[${COUNTER}]="${ITEM%%>*}" 	;    	ITEM="${ITEM#*>}"
	  STATE[${COUNTER}]="${ITEM%%>*}" 	;     	ITEM="${ITEM#*>}"
	    ZIP[${COUNTER}]="${ITEM%%>*}" 	;       ITEM="${ITEM#*>}"
	 HPHONE[${COUNTER}]="${ITEM%%>*}" 	;    	ITEM="${ITEM#*>}"
	 WPHONE[${COUNTER}]="${ITEM%%>*}" 	;  	ITEM="${ITEM#*>}"
	  EMAIL[${COUNTER}]="${ITEM%%>*}"
	 WEBURL[${COUNTER}]="${ITEM#*>}"

(( COUNTER++ ))
done

#print out each ITEM by iterating through arrays
for i in $(seq 0 $(( ${#FNAME[@]} - 1 )) ); do 
	echo "${FNAME[i]}, ${LNAME[i]}, ${COMPANY[i]}, ${STREET[i]}, ${CITY[i]}, ${COUNTY[i]}, ${STATE[i]}, ${ZIP[i]}, ${HPHONE[i]}, ${WPHONE[i]}, ${EMAIL[i]}, ${WEBURL[i]}"
done

cleanUp


# {#FNAME[@]} is getting the number of ITEMS in the array, NOT the numbering of the indexes.  i.e. 12 items, but last index is 11 (starts at 0)

# can also do echo -n to split the long echo line into two lines so it doesn't wrap on screen.  Next line would be a regular echo.
# echo -n "blah blah"
# echo "more blah"
