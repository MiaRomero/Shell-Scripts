#!/bin/bash

while getopts :hx:t: opt ; do
	case $opt in
		h) echo "${0#*/} - script to show options";;
		x) X=$OPTARG ; echo "$0 - pressed x with $X argument";;
		t) T=$OPTARG ; echo "$0 - pressed t with $T argument";;
		*) echo "$0 - unkown argument";;
	esac
done

echo $OPTIND
shift $(($OPTIND -1))
echo "\$1 is $1"


