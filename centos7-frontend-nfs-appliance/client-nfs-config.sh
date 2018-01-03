# /!\ INPROGRESS /!\

#!/bin/bash
# Configure client to use admin/frontend node as an internet gateway and NFS server

# Install nfs packages
yum -y install nfs-utils nfs-utils-libs
# Mount 
mkdir /mnt/nfs/
mount -t nfs 192.168.56.200:/mnt/shared/ /mnt/nfs
# Permanent mount
echo "192.168.56.200:/mnt/shared  /mnt/nfs  nfs rw,hard,intr 0 0" >> /etc/fstab


# Set the NFS node as the default gateway
route add default gw 192.168.56.200 enp0s8

