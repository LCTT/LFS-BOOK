#!/bin/bash

if [ $# -lt 1 ] ; then 
  echo "This script needs the location of the fo file to update"
  exit 1
fi


FILE=$1

LINE=$( grep -n "DO NOT EDIT" $FILE | cut -f1 -d: )
LINE=$(( LINE - 1 ))

# Not needed
#sed -i -e "$LINE s/monospace/&\" font-size=\"9pt/" $FILE

