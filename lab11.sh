#!/bin/bash

# lab11.sh

#Pre-req: copy /var/share/CS225/timefiles.tar.gz to your home directory and extract it
#Create a script that:
#	1. looks at the last modified timestamp of each file in timefiles
#	2. creates a directory structure for the month and day in timefiles directory
#	3. copies each file to the appropriate directory
#	4. moves each file to the appropriate directory if -f (force) is set

#Script has to include the following:
# syntax/help function
# getopts options 
# trap for control-c
# function library for generic functions (check timestamp, create directory etc..)
# uses pattern substitution

cleanUp(){
	exit
}

trap "echo 'You have chosen to stop this script' ; cleanUp" SIGINT

FORCE=FALSE

HELPMESSAGE="\r\nHelp menu for"

HELPOPTIONS="\r\nOptions for this script: \r\n
                 -d : turns on debugging \r\n
		 -f : moves each file to the appropriate directory \r\n
                 -h : prints out the help menu \r\n
                 any other option : prints help menu and exits"

SCRIPTNAME=${0#*/}

printHelpMenu(){
	echo -e "${HELPMESSAGE} ${SCRIPTNAME} ${HELPOPTIONS} \r\n"
}

getLastModificationTime(){
	VAR=$1
	DATE=$(date +"%d %B %Y" -r ${VAR})
	DAY=${DATE%% *}
	MONTH=${DATE#* }
	MONTH=${MONTH% *}
	YEAR=${DATE##* }
}

while getopts :dfh: optionChosen ; do
        case "${optionChosen}" in

                d) set -x ;; #sets debugging on

		f) FORCE=TRUE ;; #moves files to appropriate directory

                h) printHelpMenu ;; #print help menu

                *) printHelpMenu ; cleanUp;; #help, exit
        esac
done

# shift $(( ${OPTIND} -1 ))   // resets opt position to 1

for ITEM in /root/timefiles/*.txt ; do
	getLastModificationTime "${ITEM}"
	
	if [[ ! -d /root/timefiles/"${MONTH}" ]]; then
		mkdir /root/timefiles/"${MONTH}"
	fi

	if [[ ! -d /root/timefiles/"${MONTH}"/"${DAY}" ]]; then
		mkdir /root/timefiles/"${MONTH}"/"${DAY}"
	fi

	if [[ "${FORCE}" = 'TRUE' ]]; then
		mv "${ITEM}" /root/timefiles/"${MONTH}"/"${DAY}"
	fi  

	if [[ "${FORCE}" = 'FALSE' ]]; then  # can use an else statement to combine with above if. if true then move, else copy.
		cp "${ITEM}" /root/timefiles/"${MONTH}"/"${DAY}"
	fi		

done

cleanUp





