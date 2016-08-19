#!/bin/bash

LIST='1;2;3;4 5'

# IFS is the delimiter - normally space, carriage return, tab

OLDIFS=${IFS}
IFS=$';' 

for ITEM in ${LIST}; do
	echo "${ITEM}"
done

IFS=${OLDIFS} #changing back to normal IFS


for ITEM in {1..10}; do
	echo "${ITEM}"
done

#IFS=$'\n'

#for ITEM in $(cat /etc/passwd); do
#	OUTPUT=$(echo ${ITEM} | grep root)
#	echo ${OUTPUT}
#done

for ((x=1, y=2; x<=3, y<=4; x++, y++)); do
	echo $x $y
done

x=0
while [ $x -le 3 ]; do
	(( x++ ))
	echo $x
done

for ITEM in 1 2 3 4 5; do
	if [[ ${ITEM} = 3 ]]; then
		continue
	fi
	echo "Got here for iteration ${ITEM}"
done

while read -r LINE; do
	echo ${LINE}
done < /etc/passwd
