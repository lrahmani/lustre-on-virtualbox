# /!\ INPROGRESS /!\

#!/bin/bash
# Setup a Lustre MGS and a 'litio' MDS

# Configure network (enp0s3 connected to storageNET)
ifconfig enp0s3 192.168.57.3 netmask 255.255.255.0 broadcast 192.168.57.255
# Format the MGT and MDT
mkfs.lustre --mgs /dev/sdb # MGT
mkfs.lustre --fsname=litio --mgsnode=192.168.57.3@tcp --mdt --index=0  /dev/sdc # MDT
# Start the MGS and MDS
mkdir /mnt/mgt /mnt/mdt
mount -t lustre /dev/sdb /mnt/mgt # MGS
mount -t lustre /dev/sdc /mnt/mdt # MDS


