# /!\ INPROGRESS /!\

#!/bin/bash
# Setup a Lustre OSS for 'litio' filesystem
# This script is for LustreOSS1 with two OSTs OST2 and OST3

# Configure network (enp0s3 is connected to storageNET)
ifconfig enp0s3 192.168.57.5 netmask 255.255.255.0 broadcast 192.168.57.255
# Each 'litio' Lustre OSS has two OSTs
# Format each OST
mkfs.lustre --fsname=litio --ost --mgsnode=192.168.57.3@tcp --index=2 /dev/sdb # /dev/sdb on OSS1 is OST2
mkfs.lustre --fsname=litio --ost --mgsnode=192.168.57.3@tcp --index=3 /dev/sdc # /dev/sdc on OSS1 is OST3
# Start the OSS
mkdir /mnt/ost2 /mnt/ost3
mount -t lustre /dev/sdb /mnt/ost2/
mount -t lustre /dev/sdc /mnt/ost3/


