1. Install base-os and general configuration [here](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-machines-basic)

2. Download Lustre client RPMs
```bash
> cat to_download_client
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/client/RPMS/x86_64/kmod-lustre-client-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/client/RPMS/x86_64/lustre-client-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/client/RPMS/x86_64/kmod-lustre-client-tests-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/client/RPMS/x86_64/lustre-client-tests-2.10.2-1.el7.x86_64.rpm
> wget $(cat to_download_client)
```

3. Install client modules
```bash
yum localinstall kmod-lustre-client-2.10.2-1.el7.x86_64.rpm lustre-client-2.10.2-1.el7.x86_64.rpm
```

3. Install client test modules
```bash
# TOFIX require lustre-iokit
yum localinstall kmod-lustre-client-tests-2.10.2-1.el7.x86_64.rpm lustre-client-tests-2.10.2-1.el7.x86_64.rpm
```

5. Connect to the `storageNET`
```bash
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
systemctl restart network.service
# Test network connectivity with the MGS/MDT
ping 192.168.57.3
telnet 192.168.57.3 988
```

4. Mount `litio` lustre filesystem
```bash
mkdir /mnt/litio/
mount -t lustre 192.168.57.3@tcp:/litio  /mnt/litio/
```

5. Check if lustre is correctly mounted
```bash
lfs df -h
```