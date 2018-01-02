1. Install base-os and general configuration [here](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-machines-basic)
2. Get Lustre RPM packages
```bash
> cat to_download_servers
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/kernel-3.10.0-693.5.2.el7_lustre.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/lustre-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/lustre-iokit-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/lustre-osd-ldiskfs-mount-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/lustre-tests-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/kmod-lustre-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/kmod-lustre-osd-ldiskfs-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/kmod-lustre-tests-2.10.2-1.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el7/RPMS/x86_64/e2fsprogs-1.42.13.wc6-7.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el7/RPMS/x86_64/e2fsprogs-libs-1.42.13.wc6-7.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el7/RPMS/x86_64/libcom_err-1.42.13.wc6-7.el7.x86_64.rpm
https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el7/RPMS/x86_64/libss-1.42.13.wc6-7.el7.x86_64.rpm
> wget $(cat to_downloads_servers)
```
Lustre servers uses a modified linux kernel as their OS. 

3. Install Lustre kernel RPM
```bash
yum localinstall kernel-3.10.0-693.5.2.el7_lustre.x86_64.rpm 
```

4. Install the Lustre kernel (replace the current one with lustre modified kernel)
```bash
/sbin/new-kernel-pkg --package kernel --mkinitrd --dracut --depmod --install 3.10.0-693.5.2.el7_lustre.x86_64
shutdown -r now
```

5. Install `e2fsprogs` (Provides utilities for working with ext2/ext3/ext4 file systems)
```bash
yum localinstall e2fsprogs-1.42.13.wc6-7.el7.x86_64.rpm  e2fsprogs-libs-1.42.13.wc6-7.el7.x86_64.rpm \
libcom_err-1.42.13.wc6-7.el7.x86_64.rpm libss-1.42.13.wc6-7.el7.x86_64.rpm
```
6. Install Lustre modules
```bash
yum localinstall kmod-lustre-2.10.2-1.el7.x86_64.rpm kmod-lustre-osd-ldiskfs-2.10.2-1.el7.x86_64.rpm \
lustre-2.10.2-1.el7.x86_64.rpm lustre-osd-ldiskfs-mount-2.10.2-1.el7.x86_64.rpm \
lustre-iokit-2.10.2-1.el7.x86_64.rpm 
```

7. Install Lustre test modules
```bash
yum localinstall kmod-lustre-tests-2.10.2-1.el7.x86_64.rpm lustre-tests-2.10.2-1.el7.x86_64.rpm
```
