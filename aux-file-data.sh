#!/bin/bash

if [ $# -lt 1 ] ; then
  echo "This script needs the location of the xml file to update"
  exit 1
fi

FILE=$1

./make-aux-files.sh

# Bootscript data
bootscripts=$(ls lfs-bootscripts*.bz2)
base=$(basename $bootscripts .tar.bz2)
bootsize=$(ls -l --block-size=1024 $bootscripts | cut -f5 -d" ")
bootmd5=$(md5sum $bootscripts | cut -f1 -d" ")

# Figure intalled size of bootscripts
TOPDIR=$(pwd)
TMP_DIR=$(mktemp -d /tmp/lfsbootfiles.XXXXXX)
pushd $TMP_DIR > /dev/null
tar -xf $TOPDIR/$bootscripts
bootinstallsize=$(du -sk $TMP_DIR | cut -f1)
popd > /dev/null
rm -rf $TMP_DIR

sed -i -e s/BOOTSCRIPTS-SIZE/$bootsize/              \
       -e s/BOOTSCRIPTS-INSTALL-KB/$bootinstallsize/ \
       -e s/BOOTSCRIPTS-MD5SUM/$bootmd5/ $FILE

