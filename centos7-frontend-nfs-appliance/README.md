- Base configuration
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
- Set up NFS server
  1. Install NFS packages
  ```bash
  yum -y install nfs-utils nfs-utils-libs 
  ```
  2. Format `NFS.vdi` disk 
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
  3. Configure NFS as server
  ```bash
  echo "/mnt/shared/ 192.168.56.0/255.255.255.0(rw,sync,no_root_squash,no_subtree_check)" > /etc/exports
  # Set correct acces rights
  chmod -R 755 /mnt/shared/
  chown nfsnobody:nfsnobody /mnt/shared/
  ```
  4. Configure network adaptor 1, assign IP address to the NFS server on the `adminNET`
  ```bash
  ifconfig enp0s3 192.168.56.200 netmask 255.255.255.0 broadcast 192.168.56.255
  ```
  5. Start NFS
  ```bash
  systemctl enable rpcbind nfs nfs-server nfs-lock nfs-idmap
  systemctl start rpcbind nfs nfs-server nfs-lock nfs-idmap
  ```
  6. NFS client side configuration
  ```bash
  # Install nfs packages
  yum -y install nfs-utils nfs-utils-libs
  # Mount 
  mkdir /mnt/nfs/
  mount -t nfs 192.168.56.200:/mnt/shared/ /mnt/nfs
  # Permanent mount
  echo "192.168.56.200:/mnt/shared  /mnt/nfs  nfs rw,hard,intr 0 0" >> /etc/fstab
  ```
- Configure adminNode as as an internet gateway for `adminNET` network (on `enp0s3`)
  1. Configure `firewalld` (replacing `iptables`) 
  ```bash
  # run the firewall
  systemctl enable firewalld
  systemctl start firewalld
  # allow nfs ports
  firewall-cmd --permanent --add-service=nfs
  # configure NAT service
  firewall-cmd --permanent --direct --add-rule ipv4 nat POSTROUTING 0 -o enp0s9 -j MASQUERADE
  firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -i enp0s3 -o enp0s9 -j ACCEPT
  firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -i enp0s9 -o enps03 -m state --state RELATED,ESTABLISHED -j ACCEPT
  
  ```
  2. Client side configuration
  ```bash
  route add default gw 192.168.56,200 enp0s8
  ```
  
- Set up a dhcp server
  
  /!\ INROGRESS /!\
  
  ```bash
  # I'll be using dnsmasq
  yum -y install dnsmasq
  cat /etc/dnsmasq.conf
  # TODO
  ```
