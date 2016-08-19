#!/bin/bash

trap "echo 'Sorry I have trapped Ctrl-C'" SIGINT

echo "this is a test script"

count=1

while [ ${count} -le 10 ]; do
	echo "loop #${count}"
	sleep 1
	(( count++ ))
done

echo "this is the end of test script"


