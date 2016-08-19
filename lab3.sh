#1/bin/bash

# lab3.sh

#Objective:  Check a users ID and if they're root then display a message saying it's insecure to run this script as root. If they are not root then get their home directory from the /etc/password file and display the size of the contents of it. 

#Get the users ID
#Exit if the user is root
#If the user is not root make sure their userid is larger than 500
#Check to see if /etc/password exists and is readable
#Get the users home directory from /etc/passwd
#Display the size of their home directory


if [[ $UID -eq 0 ]]; then
	echo "It is insecure to run this script as root"
	exit
fi

if [[ $UID -ge 500 ]]; then
	if [[ -e /etc/passwd && -r /etc/passwd ]]; then
		HOME=$(cat /etc/passwd | grep 'Jane') | grep '/h*ne'
		echo "Home: ${HOME}";
		SIZE=$(du -h $HOME);
		echo -e "Size:\n${SIZE}"
	fi
fi
	
exit



# if [[ "${UID}" - le '500' ]] ; then
	# echo "its not safe to run this script as root or using a system account"


#
# if [[ -r "/etc/passed" ]] ; then
#	USERHOME=$(grep $(whoami) /etc/passed | ask -F: '{print $6}')
#	du -sh ${USERHOME}
