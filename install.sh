#!/bin/bash

if [[ $EUID > 0 ]]
    then echo "Please run as root"
    exit
fi

echo "Preliminary verification ..."

if ! [ -x "$(command -v prime-select)" ]; then
  echo "suse-prime package required! Install it with [ sudo zypper in suse-prime ]" >&2
  exit 1
fi

if [ -x "$(command -v optirun)" ]; then
  echo "Seems you have bumblebee or similar installed, please remove it first!" >&2
  exit 1
fi

if [ ! -d /etc/prime ] ; then
  echo "Cannot find /etc/prime directory, make sure you have the correct suse-prime package!"
  exit
fi

echo "Preparing to install ..."

#File install
echo "Copying files ..."
mkdir                             /etc/prime/services
cp config                         /etc/prime/config
cp prime_switch                   /etc/prime/services/prime_switch
cp prime_logout.waiting           /etc/prime/services/prime_logout.waiting
cp prime_switch.service           /etc/systemd/system/prime_switch.service
cp prime_logout.waiting.service   /etc/systemd/system/prime_logout.waiting.service
cp vga                            /usr/bin/vga
cp suse-prime.conf                /etc/modprobe.d/suse-prime.conf
echo "Done."

#Permissions
echo "Setting permissions ..."
chmod +x /etc/prime/services/prime_switch
chmod +x /etc/prime/services/prime_logout.waiting
chmod +x /usr/bin/vga
echo "Done."

#Service
echo "Setting service ..."
systemctl enable prime_switch
echo "Done."

#Modprobe_rules
echo "Setting modprobe rules ..."
mkinitrd
echo "Done."

echo "Installation completed successfully! Please REBOOT and use [ vga ] command to know how to use"






