1. Boot the vm with `CentOS-7-x86_64-Minimal-1708.iso` as a live CD
2. Install CentOS and reboot
3. Configure network adaptor as `NAT` on virtualbox
4. Install dependencies and recommended packages and tools
```bash
## dependencies from http://lustre.ornl.gov/lustre101-courses/content/C1/L3/LustreBasicInstall.pdf, page 10
yum -y install perl libgssglue net-snmp libyaml sg3_utils openmpi lsof rsync
## useful tools
yum -y install wget net-tools telnet 
```
5. Configure the system
```bash
## Ensure that each machine has a non-loopback entry for itself in /etc/hosts
echo "" > /etc/hosts
## Create an entry in /etc/modprobe.d/lustre.conf
echo "options lnet networks=tcp" > /etc/modprobe.d/lustre.conf
## Disable firewall
systemctl disable firewalld
systemctl stop firewalld
## Disable SELinux
sed -i '/^SELINUX=/c\SELINUX=disabled' /etc/sysconfig/selinux
```