
#!/bin/bash

VAR="this.is.a.dotted.line"

echo ${VAR} | awk -F. '{print$4}'

echo ${VAR#*.}

echo ${VAR%.*}

echo ${VAR##*.}

echo ${VAR%%.*}


for i in {1..100}; do
	for j in {1..100}; do
#		VAR2=$(echo ${VAR} | awk -F. '{print$4}'

		VAR2=${VAR%.*}
	done
done

#use time to see the time difference in running these two scripts.  Awk is MUCH 
#slower!!
	




















