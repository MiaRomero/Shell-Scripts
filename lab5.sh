#!/bin/bash

#lab5.sh

#Objective:  Loop through data and act on each entry

#Loop through the items in medialist.txt
#Check to see if each item exists in the medialab directory
#If it does output the name to a new file called foundfiles.txt
#if it doesn't output the name to a new file called lostfiles.txt
#save your script as lab5.sh
 
#Pre-reqs: 
#copy /var/share/CS225/cs225-medialab.tar.gz to your home directory
#extract cs225-medialab.tar.gz 

for ITEM in $(cat /home/medialab/medialist.txt); do

	if [[ -f /home/medialab/${ITEM} ]]; then

		echo ${ITEM} >> /home/medialab/foundfiles.txt
	else
		echo ${ITEM} >> /home/medialab/lostfiles.txt
fi

done


# DIR="medialab"
# LIST=$(cat "${DIR}/medialist.txt")

# create new blank files
# echo "" > foundfiles.txt  // create file if doesnt exist, but if it does, wipes it clean to be used for this script
# echo "" > lostfiles.txt


# change IFS in case there is a space in an ITEM
#IFS=$'\n'

# for ITEM in ${LIST} ; do   // REMEMBER!! when iterating through LIST variable, DO NOT quote it!!
#	if [[ -e "medialab/"${ITEM}" ]] ; then
#		echo "${ITEM}" >> foudfiles.txt
# 	else
#		echo . .



# _________________________

# while read -r ITEM; do   
# 	if . . . 

#	fi
# done < "${LIST}"   // remember this end part! feeding LIST into read (looks backwards)  
