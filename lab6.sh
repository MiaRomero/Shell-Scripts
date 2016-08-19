#!/bin/bash

# lab6.sh

#Objective: Create a script called lab6.sh that will check to see if each media file in the medialab directory is in medialab/media.xml.

#List the filenames in the medialab directory that are not in media.xml
#Display the number of files in the medialab directory that are not in media.xml
#List the media files by name in media.xml that do not exist in the medialab directory
#Display the number of files that are in the media.xml that do not exist in the medialab directory

#Pre-req: Copy /var/share/CS225/cs225-medialab.tar.gz to your home directory and extract it. If you already did this for Lab 5 then skip it.

#Desired Output:

#Files not in media.xml:
# file1.mpg
# file2.mpg
# file3.mpg
#Files not in medialab directory:
# file1.mpg
# file2.mpg
# file3.mpg
# 3 media files in medialab directory that are NOT listed in media.xml
# 3 media files in media.xml that are NOT in medialab directory 


MEDIALABLIST=$( ls /home/medialab | grep 'mpg\|mp3')  # DIR="medialab"   LIST="${DIR}/*.mp[g3]"

XMLLIST=$( cat /home/medialab/media.xml | grep 'mpg\|mp3' | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
			# grep '.mp[g3]' "/home/medialab/media.xml" | awk  . . . .  // can put "/hom . . ." in VAR too.
	

MLCOUNT=0
XMLCOUNT=0

echo "Files not found in media.xml:"
for ITEM in ${MEDIALABLIST}; do 

	if ! echo "${XMLLIST}" | grep -q "${ITEM}" ; then  # if ! grep -q "${ITEM}" "${XMLIST}" ; then
		echo ${ITEM}
		(( MLCOUNT++ ))		
	fi
done

echo "Files not found in medialab directory:"
for ITEM in ${XMLLIST}; do
	if ! echo "${MEDIALABLIST}" | grep -q "${ITEM}" ; then  # if [[ ! -e "${ITEM}" ]] ; then 
		echo ${ITEM}
		(( XMLCOUNT++ ))
	fi
done

echo ${MLCOUNT} "media files in medialab directory that are NOT listed in media.xml"
echo ${XMLCOUNT} "media files in media.xml that are NOT listed in medialab directory"

# 
