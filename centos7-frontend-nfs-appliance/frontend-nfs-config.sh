# /!\ INPROGRESS /!\

#!/bin/bash
# Configure the admin/frontend node as an internet gateway and NFS server

# Configure network adaptor 3 - connect to the internet
dhclient enp0s9 -v

# Install recommended tools
yum -y install net-tools telnet 

# Install NFS packages
yum -y install nfs-utils nfs-utils-libs 

# Prepare the NFS storage disk
(
echo o # Create a new empty DOS partition table
echo n # Add a new partition
echo p # Primary partition
echo 1 # Partition number
echo   # First sector (Accept default: 1)
echo   # Last sector (Accept default: varies)
echo w # Write changes
) | fdisk /dev/sdb
# format as ext4
mkfs.ext4 /dev/sdb1
# mount the formated partition
mkdir /mnt/shared/
mount /dev/sdb1 /mnt/shared/

# Configure NFS server
echo "/mnt/shared/ 192.168.56.0/255.255.255.0(rw,sync,no_root_squash,no_subtree_check)" > /etc/exports
# Set correct acces rights
chmod -R 755 /mnt/shared/
chown nfsnobody:nfsnobody /mnt/shared/

# Configure network adaptor 1 - connected to adminNET
ifconfig enp0s3 192.168.56.200 netmask 255.255.255.0 broadcast 192.168.56.255

# Start NFS server
systemctl enable rpcbind nfs nfs-server nfs-lock nfs-idmap
systemctl start rpcbind nfs nfs-server nfs-lock nfs-idmap

# Configure node as a gateway for adminNET network 
# run the firewall
systemctl enable firewalld
systemctl start firewalld
# allow nfs ports
firewall-cmd --permanent --add-service=nfs
# configure NAT service
firewall-cmd --permanent --direct --add-rule ipv4 nat POSTROUTING 0 -o enp0s9 -j MASQUERADE
firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -i enp0s3 -o enp0s9 -j ACCEPT
firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -i enp0s9 -o enps03 -m state --state RELATED,ESTABLISHED -j ACCEPT
