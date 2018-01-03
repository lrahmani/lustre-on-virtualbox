1. Boot the vm with `CentOS-7-x86_64-Minimal-1708.iso` as a live CD
2. Install CentOS and reboot
3. Configure network adaptor 3 as `NAT` on virtualbox
```bash
dhclient enp0s9 -v
```
4. Install needed and recommended/useful packages
```bash
yum -y install net-tools telnet 
```
5. Install NFS packages
```bash
yum -y install nfs-utils nfs-utils-libs 
```
6. Format `NFS.vdi` disk 
```bash
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
```
7. Configure NFS as server
```bash
echo "/mnt/shared/ 192.168.56.0/255.255.255.0(rw,sync,no_root_squash,no_subtree_check)" > /etc/exports
```
8. Configure network, assign IP address to the NFS server on the `adminNET`
```bash
ifconfig enp0s3 192.168.56.200 netmask 255.255.255.0 broadcast 192.168.56.255
```
8. Start NFS
```bash
systemctl enable rpcbind nfs nfs-server nfs-lock nfs-idmap
systemctl start rpcbind nfs nfs-server nfs-lock nfs-idmap
```
9. Configure adminNode as an internet gateway for`adminNET` netowrk (on `enp0s3`)
```bash

```
