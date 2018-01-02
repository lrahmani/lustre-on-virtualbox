# /!\ INPROGRESS /!\

#!/bin/bash
# Provision virtual cluster for testing Lustre PFS using VBoxManage
# Cluster Arch
# > VMS
#  * LustreMGS-MDS: 
#    - 3 storage devices (LustreMGS-MDS,MGT,MDT), 
#    - 2 network interfaces ('storageNET', 'adminNET')
#  * LustreOSS0: 
#    - 3 storage devs (LustreOSS0,OST0,OST1), 
#    - 2 network ifs ('storageNET', 'adminNET')
#  * LustreOSS1: 
#    - 3 storage devs (LustreOSS1,OST2,OST3), 
#    - 2 network ifs ('storageNET', 'adminNET')
#  * ComputeNode0: 
#    - 1 storage dev (ComputeNode0), 
#    - 2 network ifs ('storageNET', 'adminNET')
#  * ComputeNode1: 
#    - 1 storage dev (ComputeNode1), 
#    - 2 network ifs ('storageNET', 'adminNET')
#  * FrontNode-NFS: 
#    - 1 storage dev (FrontNode-NFS), 
#    - 3 network ifs ('storageNET', 'adminNET', NAT)
# > VirtualNetworks
#  * ('storageNET',Internal Network): storage dedicated network
#  * ('adminNET',Internal Network): administration and internet access dedicated network
#  * NAT: bridged network for internet access from Host
# > VirtualStorageDevices
#  * LustreMGS-MDS, LustreOSS0, LustreOSS1, ComputeNode0, ComputeNode1, FrontNode-NFS: 
#    - 4GB VDI each
#  * MGT, MDT: 
#    - 8GB VDI each
#  * OST0, OST1, OST2, OST3: 
#    - 16GB VDI each



