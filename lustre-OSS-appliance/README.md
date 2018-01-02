Two OSTs are attached to `OSS1`: `OST2` and `OST3`.

1. Install base-os, lustre linux kernel, and lustre packages [here](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-Servers-(OSS,MGS,MDS))

2. Configure the network, attach `OSS1` to the `storageNET`
```bash
ifconfig enp0s3 192.168.57.5 netmask 255.255.255.0 broadcast 192.168.57.255
# Test connectivity to the MGS/MDT node
ping 192.168.57.3 # raw ip addresses should be changed to hostnames
telnet 192.168.57.3 988
```
3. Format each OST
```bash
mkfs.lustre --fsname=litio --ost --mgsnode=192.168.57.3@tcp --index=2 /dev/sdb # /dev/sdb on OSS1 is OST2
mkfs.lustre --fsname=litio --ost --mgsnode=192.168.57.3@tcp --index=3 /dev/sdc # /dev/sdc on OSS1 is OST3
```

4. Start the OSS
```bash
mkdir /mnt/ost2 /mnt/ost3
mount -t lustre /dev/sdb /mnt/ost2/
mount -t lustre /dev/sdc /mnt/ost3/
```