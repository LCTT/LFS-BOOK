#! /bin/bash

# This script generates rules for persistent network device naming
# Data from udev-182 75-persistent-net-generator.rules
# Updated fof udev-197 (DEVICES=en*)

RULES=/etc/udev/rules.d/70-persistent-net.rules 
DEVICES=$(eval echo /sys/class/net/{en*,eth*,ath*,wlan*[0-9],msh*,ra*,sta*,ctc*,lcs*,hsi*})

function usage
{
  echo $msg
  echo "init-net-rules.sh is an LFS-specific script to initialize"
  echo "$RULES"
  exit 1
}

declare -A VENDORS_IGNORED
VENDORS_IGNORED['52:54:00:']="kvm"
VENDORS_IGNORED['00:0c:29:']="vmware"
VENDORS_IGNORED['00:50:56:']="vmware"
VENDORS_IGNORED['00:15:5d:']="hyper-v"
VENDORS_IGNORED['00:00:00:']="invalid"

declare -A VENDORS
VENDORS['02:07:01:']="Interlan, DEC, etc"
VENDORS['02:60:60:']="3com"
VENDORS['02:60:8c:']="3Com IBM PC; Imagen. etc"
VENDORS['02:a0:c9:']="intel"
VENDORS['02:aa:3c:']="Olivetti"
VENDORS['02:cf:1f:']="Masscomp, Silicon Graphics, etc"
VENDORS['02:e0:3b:']="Gigabit"
VENDORS['02:e6:d3:']="BTI"
VENDORS['52:54:00:']="Realtek"
VENDORS['52:54:4c:']="Novell"
VENDORS['52:54:ab:']="Realtek"
VENDORS['e2:0c:0f:']="Kingston"
VENDORS['00:16:3e:']="Xensource"

function ignore_if
{
   if [[ "${VENDORS_IGNORED[$VENDOR]}" != "" ]]; then return 0; fi
   if [[ "${VENDORS[$VENDOR]}"         != "" ]]; then return 1; fi

   byte2=$(echo $VENDOR | cut -c2)
   if echo $byte2 | grep -q "[2367abef]"; then return 0; fi

   return 1  # Default is to not ignore
}

function comment
{
  # Not implemented
  # SUBSYSTEMS=="pci"
  # export COMMENT="PCI device $attr{vendor}:$attr{device} ($driver)"

  # SUBSYSTEMS=="usb", ATTRS{idVendor}=="?*"
  # export COMMENT="USB device 0x$attr{idVendor}:0x$attr{idProduct} ($driver)"

  # SUBSYSTEMS=="pcmcia",
  # export COMMENT="PCMCIA device $attr{card_id}:$attr{manf_id} ($driver)"

  # SUBSYSTEMS=="ieee1394",
  # export COMMENT="Firewire device $attr{host_id})"

  # ibmveth likes to use "locally administered" MAC addresses
  # DRIVERS=="ibmveth",
  # export COMMENT="ibmveth ($id)"

  # S/390 uses id matches only, do not use MAC address match
  # SUBSYSTEMS=="ccwgroup", 
  # export COMMENT="S/390 $driver device at $id", 
  # export MATCHID="$id" 
  # export MATCHDRV="$driver"
  # export MATCHADDR=""

  # Default
  driver=$(basename $(readlink -f $NIC/device/driver/module))
  export COMMENT="net device ${driver}"
}

if ! mountpoint -q /sys; then
  msg="/sys must be mounted"
  usage
fi

if ! mountpoint -q /proc; then
  msg="/proc must be mounted"
  usage
fi

if [ -e $RULES ]; then
  msg="The rules file already exists"
  usage
fi

# Ignore Xen virtual interfaces
if [ -e /proc/xen ]; then
  msg="The rules file should not be created in the Xen environment"
  usage
fi 

# Variables used to communicate with write_net_rules:
#   INTERFACE             simple interface name         
#   MATCHADDR             MAC address used for the match
#   MATCHID               bus_id used for the match
#   MATCHDRV              driver name used for the match
#   MATCHIFTYPE           interface type match
#   COMMENT               comment to add to the generated rule
#   INTERFACE_NAME        requested name supplied by external tool
#   INTERFACE_NEW         new interface name returned by rule writer

for NIC in $DEVICES; do
     IF=${NIC##*/}
     if echo $NIC | grep -q '*' ; then continue; fi

     export INTERFACE=${NIC##*/}            # Simple interface name
     export MATCHADDR="$(cat $NIC/address)" # Read MAC address

     VENDOR=$(echo $MATCHADDR | cut -c-9)
     if ignore_if; then continue; fi

     export MATCHDEVID="$(cat $NIC/dev_id)"
     export MATCHIFTYPE="$(cat $NIC/type)"  # Read interface type
     comment

     /lib/udev/write_net_rules 
done

