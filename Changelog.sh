#!/bin/bash
{
  echo $1
  echo 'export COMMIT_MESSAGE=\'$(git log --format=oneline -n 1 $CIRCLE_SHA1)\'' >> ~/.bashrc
} >changelog.txt
FILE='changelog.txt'
IP='vhundef.net'
USER='admin_vh'
PASS='Vhn323884489'
DESTINATION='public_html'
ftp -p -d -inv $IP<< !EOF
user $USER $PASS
cd $DESTINATION
asc
mput $FILE
rename $FILE $1-$FILE
quit
!EOF