#!/bin/bash

# Boot scripts
for s in bootscripts/lfs/init.d/*       \
         bootscripts/lfs/sysconfig/*    \
         bootscripts/lfs/lib/services/* \
         bootscripts/lfs/sbin/*         \
         udev-lfs/*.rules
do
  script=$(basename $s)
  
  # Skip directories
  [ $script == 'network-devices' ] && continue
  #[ $script == 'services'        ] && continue

  # Disambiguate duplicate file names
  [ $s == 'bootscripts/lfs/sysconfig/rc'         ] && script='rc-sysinit'; 
  [ $s == 'bootscripts/lfs/sysconfig/modules'    ] && script='modules-sysinit'; 
  [ $s == 'bootscripts/lfs/sysconfig/udev_retry' ] && script='config-udev-retry'; 
  
  sed  -e 's/\&/\&amp\;/g' -e 's/</\&lt\;/g'   -e 's/>/\&gt\;/g' \
       -e "s/'/\&apos\;/g" -e 's/"/\&quot\;/g' -e 's/\t/    /g'  \
       $s > appendices/${script}.script 
done
