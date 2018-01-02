# /!\ INPROGRESS /!\

#!/bin/bash
# Install and configure Lustre servers (MGS,MDS,OSS) common packages

# Get RPM packages
wget $(cat to_downloads_servers)
# Install Lustre server kernel
yum -y localinstall kernel-3.10.0-693.5.2.el7_lustre.x86_64.rpm 
# Setup lustre linux-modified kernel and reboot
/sbin/new-kernel-pkg --package kernel --mkinitrd --dracut --depmod --install 3.10.0-693.5.2.el7_lustre.x86_64
shutdown -r now
# Install `e2fsprogs` (Provides utilities for working with ext2/ext3/ext4 file systems)
yum -y localinstall e2fsprogs-1.42.13.wc6-7.el7.x86_64.rpm  e2fsprogs-libs-1.42.13.wc6-7.el7.x86_64.rpm \
libcom_err-1.42.13.wc6-7.el7.x86_64.rpm libss-1.42.13.wc6-7.el7.x86_64.rpm
# Install Lustre modules
yum -y localinstall kmod-lustre-2.10.2-1.el7.x86_64.rpm kmod-lustre-osd-ldiskfs-2.10.2-1.el7.x86_64.rpm \
lustre-2.10.2-1.el7.x86_64.rpm lustre-osd-ldiskfs-mount-2.10.2-1.el7.x86_64.rpm \
lustre-iokit-2.10.2-1.el7.x86_64.rpm 
# Install test modules
yum -y localinstall kmod-lustre-tests-2.10.2-1.el7.x86_64.rpm lustre-tests-2.10.2-1.el7.x86_64.rpm


