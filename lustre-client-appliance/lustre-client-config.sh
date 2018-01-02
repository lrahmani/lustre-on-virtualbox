# /!\ INPROGRESS /!\

#!/bin/bash
# Install and configure a Lustre client 

# Download Lustre client packages
wget $(cat to_download_client)
# Install Lustre client packages
yum localinstall kmod-lustre-client-2.10.2-1.el7.x86_64.rpm lustre-client-2.10.2-1.el7.x86_64.rpm
# Install tests packages
# TOFIX require lustre-iokit
yum localinstall kmod-lustre-client-tests-2.10.2-1.el7.x86_64.rpm lustre-client-tests-2.10.2-1.el7.x86_64.rpm
# Connect to the `storageNET`
# Temporary configuration
ifconfig enp0s3 192.168.57.22 netmask 255.255.255.0 broadcast 192.168.57.255
# Or permanent configuration
echo "
# Get the MAC addr from vm settings on vbox
HWADDR=08:00:27:d1:90:6c  
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
# Dont use dhcp
BOOTPROTO=no
IPADDR=192.168.57.22
PREFIX=24
DEFROUTE=yes
IPV6INIT=no
NAME=enp0s3
DEVICE=enp0s3
ONBOOT=yes
" > /etc/sysconfig/network-scripts/ifcfg-enp0s3
# Restart network service
systemctl restart network.service
# Mount `litio` lustre filesystem
mkdir /mnt/litio/
mount -t lustre 192.168.57.3@tcp:/litio  /mnt/litio/


