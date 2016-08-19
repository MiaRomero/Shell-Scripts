#!/bin/bash

# lab8.sh

#Objective: Using the last line of /var/share/CS225/addresses.csv gather each field into the following variables using bash pattern substitution. Do NOT use awk for this!
# FNAME
# LNAME
# COMPANY
# STREET
# CITY
# STATE
# ZIP
# HPHONE
# WPHONE
# EMAIL
# WEBURL


LINE=$( tail -1 /var/share/CS225/addresses.csv)
LINE=${LINE//\"/  }

FNAME=${LINE%%,*}
LINE=${LINE#*,}

LNAME=${LINE%%,*}
LINE=${LINE#*,}

COMPANY=${LINE%%,*}
LINE=${LINE#*,}

STREET=${LINE%%,*}
LINE=${LINE#*,}

CITY=${LINE%%,*}
LINE=${LINE#*,}
LINE=${LINE#*,}

STATE=${LINE%%,*}
LINE=${LINE#*,}

ID=${LINE%%,*}
LINE=${LINE#*,}

HPHONE=${LINE%%,*}
LINE=${LINE#*,}

WPHONE=${LINE%%,*}
LINE=${LINE#*,}

EMAIL=${LINE%%,*}

WEBURL=${LINE#*,}

exit

# if you use "," as the delimiter, make sure to escape the "s i.e. LINE="${LINE%%\",\"*}"
