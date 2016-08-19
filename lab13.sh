#!/bin/bash

# lab13.sh

#Objective: Create a script with four functions using BASH's in process regular expressions to check the validity of Social Security numbers, telephone numbers, IP addresses and credit card numbers based on each particular data format. (User doesn't know what kind of number they are entering)

# 1.Each function will be named check_ip, check_ssn, check_pn and check_ccn.
# 2.Each function will take one argument - the data in question
# 3.Each function will return a message and a 1 or 0 depending on the outcome of the comparison
# 4.Create a select menu asking the user which piece of data they want to check and prompt the user to type in the info
# 5.Make sure the script traps control-c and exits
# 6.Make sure the script prints out help if no argument is given.

cleanUp(){
	exit
}

trap "echo ' You have chosen to stop this script' ; cleanUp" SIGINT

HELPMESSAGE="\r\nHelp menu for"

HELPOPTIONS="\r\nOptions for this script: \r\n
		 -d : turns on debugging \r\n
		 -h : prints out help menu \r\n
		 any other option : prints help menu and exits"

SCRIPTNAME=${0#*/}

NUMBER=$1

printHelpMenu(){
	echo -e "${HELPMESSAGE}" "${HELPOPTIONS}" "${SCRIPTNAME} \r\n"
}

while getopts :dh optionChosen ; do
	case "${optionChosen}" in
		d) set -x ;;
		h) printHelpMenu ; cleanUp ;;
		*) printHelpMenu ; cleanUp ; exit ;;
	esac
done

NUMBER=$1

check_ip(){

	TESTNUM=$1
	IPREGEX='(([0-9][0-9]?|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9][0-9]?|1[0-9]{2}|2[0-4][0-9]|25[0-5])'
	#can group a group (above)
	if [[ "${TESTNUM}" =~ $IPREGEX ]] ; then
		return 0
	else
		return 1
	fi
}

check_ssn(){

	TESTNUM=$1
	SSNREGEX='^[0-9]{3}[-. ]?[0-9]{2}[-. ]?[0-9]{4}$'  # make sure - is at the beginning of set or it will think it's a range.

	if [[ "${TESTNUM}" =~ $SSNREGEX ]] ; then
		return 0
	else
		return 1
	fi
}

check_pn(){

	TESTNUM=$1
	PHONEREGEX='^1?[-. (]?[[:digit:]]{3}[-. )]?[[:digit:]]{3}[-. ]?[[:digit:]]{4}$'

	if [[ "${TESTNUM}" =~ $PHONEREGEX ]] ; then  #cannot quote var in double brackets if a regex
		return 0
	else
		return 1
	fi
}

check_ccn(){
	
	TESTNUM=$1
	CCNREGEX='^[3-6][0-9]{3}[-. ]?[0-9]{4}[-. ]?[0-9]{4}[-. ]?[0-9]{4}$'

	if [[ "${TESTNUM}" =~ $CCNREGEX ]] ; then
		return 0
	else
		return 1
	fi
}

if    check_pn  "${NUMBER}" ; then
	echo "This number is a phone number"
	cleanUp
elif  check_ssn "${NUMBER}" ; then
	echo "This number is a Social Security number"
	cleanUp
elif  check_ip  "${NUMBER}" ; then
	echo "This is an IP address"
	cleanUp
elif  check_ccn "${NUMBER}" ; then
	echo "This is a credit card number"
	cleanUp
else    echo "This number is not valid"
	exit 1   # remember cleanUp is an exit 0, make sure you specify exit 1 if there is an error
fi

cleanUp

