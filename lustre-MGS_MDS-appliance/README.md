1. Install base-os, lustre linux kernel, and lustre packages [here](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-Servers-(OSS,MGS,MDS))

2. Configure the network, connect to `storageNET`
```bash
ifconfig enp0s3 192.168.57.3 netmask 255.255.255.0 broadcast 192.168.57.255
```

3. Format the MGT and MDT
```bash
mkfs.lustre --mgs /dev/sdb # MGT
mkfs.lustre --fsname=litio --mgsnode=192.168.57.3@tcp --mdt --index=0  /dev/sdc # MDT
```

4. Start the MGS and MDS
```bash
mkdir /mnt/mgt /mnt/mdt
mount -t lustre /dev/sdb /mnt/mgt # MGS
mount -t lustre /dev/sdc /mnt/mdt # MDS
```