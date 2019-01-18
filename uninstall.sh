#!/bin/bash

if [[ $EUID > 0 ]]
    then echo "Please run as root"
    exit
fi

if [ ! -d /etc/prime/services ] ; then
  echo "This script is NOT installed, aborting ..."
  exit
fi

echo "Preparing to uninstall ..."

#Service
echo "Disabling service ..."
systemctl disable prime_switch
echo "Done."

#File install
echo "Removing files ..."
rm -r                           /etc/prime/services
rm                              /etc/prime/config
rm                              /etc/systemd/system/prime_switch.service
rm                              /etc/systemd/system/prime_logout.waiting.service
rm                              /usr/bin/vga
rm                              /etc/modprobe.d/suse-prime.conf
echo "Done."

#Modprobe_rules
echo "Restoring modprobe rules ..."
mkinitrd
echo "Done."

echo "Script uninstalled successfully!"






