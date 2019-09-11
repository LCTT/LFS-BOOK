#!/bin/bash

# obfuscate.sh
# obfuscate email addresses in XML/HTML
# Script written (and slight perl modification) by Archaic <archaic AT linuxfromscratch D0T org>
# Modified from "sed -i" to old style "sed -e" by Manuel Canales <manuel AT linuxfromscratch D0T org>
# to prevent hangs on very long files, like nonckunked books.
# Original Perl expression by Anderson Lizardo <lizardo AT linuxfromscratch D0T org>
# Released under the GNU General Public License
#
# This script currently only seeks out mailto: addresses. If those same
# addresses also appear in plaintext, we need to obfuscate those as well.
#
# This script was made for a very specific purpose so I was a bit lazy in
# writing the regex's.
#
# Please send comments, enhancements, etc. to the above address

#set -e  # Bail on all errors

# First, ensure that we are given a file to process
# if [ $# -lt 1 ]; then
#   echo -e "\nYou must provide an input file."
#   exit 1
# fi

# Nothing like a backup plan!
#cp "$1" "$1".bak

for i in `grep -o '"mailto:.*@.*"' ${1} |sed -e 's|^"mailto:||' -e 's|"$||'`; do
  link=`echo $i | perl -pe 's/[^\n]/"\\\&#".ord($&)."\;"/ge'`
  plaintext=`echo $i | sed -e 's|@| AT |' -e 's|\.| D0T |g'`
  cp ${1}{,.tmp}
  sed -e "s|mailto:$i|mailto:$link|" \
      -e "s|$i|$plaintext|" ${1}.tmp > ${1}
  rm ${1}.tmp
done
#rm $FILE.tmp
#exit 0
