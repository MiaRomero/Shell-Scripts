#!/bin/bash

# lab10.sh

#Objective: Create a script that does work and cleans up if forced to exit
#Script should list all files one per line in the entire OS
#The filelist should be stored in a temporary file
#If a user presses control-c a function will clean up the temporary file and exit

TEMP=$(mktemp testing.XXXXXX)

cleanUp(){
	rm -f ${TEMP}
	exit
}

trap "echo '*You have chosen to exit this script*' ; cleanUp ; exit" SIGINT
	
COUNT=1

listFilesInOS() {
	for ITEM in $(ls -AR1 / | grep -v '^$' | grep -v ':$'); do
		echo "Filename ${COUNT}: ${ITEM}" | tee -a ${TEMP} # this is terrible! Takes 42 minutes!! to use tee -a
		(( COUNT++ ))
	done
}

listFilesInOS

cleanUp


# TEMPDIR=${mktemp -d}
# TEMPFILE=$(mktemp -p "${TEMPDIR}")

# cleanUp(){
#	echo "Terminate signal caught.  Cleaning up . . ."
#	if rm -Rf "${TEMPDIR}" ; then
#		exit 0
#	else
#		exit 1  // if unable to delete temp, get return code of 1 (error message)
#	fi
# }
# trap cleanUp SIGINT

# Change IFS in case there are spaces in the filenames
# IFS=$'\n'
# LIST=$(find / -printf "%\n")
# for FILE in $LIST ; do 
#	echo "file ${COUNT} : ${FILE}"
#	echo "file ${COUNT} : ${FILE}" >> "${TEMPFILE}"
#	((COUNT++))
# done


# Below is not bash code, only shorthand on what the code does**
# find / + echo ${FILE##*/} >> ${TEMPFILE} ; echo ${FILE##*/} takes 18 seconds

# find / -printf "%f\n" + echo ${FILE} >> ${TEMPFILE} ; echo ${FILE}  takes 15 seconds

# find / -printf "%f\n" + MSG[$COUNT]="File ${COUNT}: ${FILE} ; echo ${MSG[@] >> $TEMPFILE ; cat $TEMPFILE   takes 11.7 seconds

