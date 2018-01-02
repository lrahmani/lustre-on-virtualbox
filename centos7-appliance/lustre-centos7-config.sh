# /!\ INPROGRESS /!\

#!/bin/bash
# Prepare system for lustre and install dependencies
# As recommended by the official manual and ORNL Lustre 101 course

# dependencies 
yum -y install perl libgssglue net-snmp libyaml sg3_utils openmpi lsof rsync
# useful tools
yum -y install wget net-tools telnet 
# Ensure that each machine has a non-loopback entry for itself in /etc/hosts
echo "" > /etc/hosts
# Create an entry in /etc/modprobe.d/lustre.conf
echo "options lnet networks=tcp" > /etc/modprobe.d/lustre.conf
# Disable firewall
systemctl disable firewalld
systemctl stop firewalld
# Disable SELinux
sed -i '/^SELINUX=/c\SELINUX=disabled' /etc/sysconfig/selinux

