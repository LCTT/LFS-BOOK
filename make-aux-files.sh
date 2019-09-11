#!/bin/bash

rm -f lfs-bootscripts*.tar.?z*

# Get base file name and move bootscripts directory to that name
version=`grep "ENTITY lfs-bootscripts-version" packages.ent |cut -d'"' -f2`
mv bootscripts lfs-bootscripts-$version

# Create the tarball and clean up
tar -cJf lfs-bootscripts-$version.tar.xz --exclude .svn lfs-bootscripts-$version
mv lfs-bootscripts-$version bootscripts 

#rm -f udev-config*.bz2

# Get file name and move udev config directory to that name
#version=`grep "ENTITY udev-config " packages.ent |cut -d'"' -f2`
#mv udev-config $version

# Create the tarball and clean up
#tar -cjf $version.tar.bz2 --exclude .svn $version
#mv $version udev-config

