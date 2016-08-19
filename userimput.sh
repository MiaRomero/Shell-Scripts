#1/bin/bash


fif [[ $1 = 1 ]]; then
	echo "Is number 1"
elif [[ $1 = 2 ]]; then
	echo "is number 2"
elif [[ $1 = 3 ]]; then
	echo "Is number 3"
fi
# doing the above reads the number and compares it three times.  Slow. Instead to case below.

# Case.  Not always easy to read though.  Can't use double brackets. Can't use regular exp.

case $1 in
	1|4) echo "is number 1 or 4";;
	2) echo "is number 2";;
	3) echo "is number 3";;
	*) echo "is something else";;
esac



