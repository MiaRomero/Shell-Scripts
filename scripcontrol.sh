#!/bin/bash

OUTFILE='addresses.sql'
IFS=','

while read FNAME LNAME COMPANY STREET CITY STATE STATEABR ZIP HPHONE WPHONE EMAIL WEBSITE ;do
cat >> ${OUTFILE} << EOF
INSERT INTO members (fname,lname,street,city,state,zip) VALUES
('${FNAME}', '${LNAME}', '${STREET}', '${CITY}', '${STATE}', '${ZIP}') ; 
EOF
done < ${1}
