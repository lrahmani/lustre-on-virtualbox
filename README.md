# How to deploy Lustre 2.10 on a VirtualBox's virtual cluster

_For previous versions, check [this wiki](https://github.com/lrahmani/lustre-on-virtualbox/wiki/Deploy-Lustre-on-a-VirtualBox-Cluster) page_

## Intro

This is a quick tutorial on how to install and deploy a Lustre parallel 
filesystem in a virtual cluster for learning/testing purposes. The tutorial  
provides scripts for (1) creating the virtual cluster, including VMs, storage 
devices, and networks using VirtualBox (2) full installation and configuration 
of Luster servers and client (3) Deploying and testing the installed Lustre 
filesystem. More will be added eventually, tutorial is still in progress ...

Disclaimer: I am in no way a Lustre expert, this exists only to document the 
procedure and push to a reproducible way of doing it. All used references are 
listed in the [References](https://github.com/lrahmani/lustre-on-virtualbox/wiki/references) 
wikipage. In short, here is the main references I used for this tutorial:
- ORNL's Lustre 101 courses "[Basic Lustre Installation and Setup from Stock RPMs](http://lustre.ornl.gov/lustre101-courses/content/C1/L3/LustreBasicInstall.pdf)" tutorial, 
- Intel's Lustre deployement walk-through "[Walk-thru- Deploying Lustre pre-built RPMs](https://wiki.hpdd.intel.com/display/PUB/Walk-thru-+Deploying+Lustre+pre-built+RPMs)",
- and (obviously) Lustre reference manual ["Lustre Software Release 2.x - Operations Manual"](http://doc.lustre.org/lustre_manual.pdf), which is very complete

## What this tutorial will allow you to do
>_**To install, configure, and deploy a complete Lustre filesystem in an 
HPC-like (software) architecture VirtualBox virtualized cluster**_

#### This includes
- creating the virtual cluster: virtual machines (vms), virtual networks, 
virtual storage devices
- configuring the virtual cluster: install base-os, configure compute nodes, 
admin node with NFS and DHCP server
- installing and deploying Lustre: configure storage nodes to host Lustre 
servers and compute nodes as Lustre client

#### Here is how the virtual cluster will look like by the end of this tutorial

![virtual-cluster-arch](https://github.com/lrahmani/lustre-on-virtualbox/blob/master/cluster-provision-vbox/virtual-cluster-arch.png)

## Requirements

- A Linux host machine with at least 8Gb of RAM and 22Gb of free disk space, 
connected to the internet
- Oracle's VirtualBox installed

## Quick steps
- [Lustre in a nutshell](https://docs.google.com/presentation/d/1ivuUxfF8aVkSPqAYfkqZLIN88KkvF8Oy-KGfNqm6YAk/edit?usp=sharing)
- [Create a CentOS 7 minimal appliance, that will be the base of each VM installation](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-machines-basic)
- [Install and configure Lustre servers](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-Servers-(OSS,MGS,MDS))
  - [MGS/MDS](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-mgs-mds)
  - [OSS](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-OSS)
- [Install and configure Lustre clients](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-client)

## Step by step tutorial

/!\ _**INPROGRESS**_ /!\

1. [Provision the virtual cluster using `VBoxManage`](https://github.com/lrahmani/lustre-on-virtualbox/wiki/provision-cluster-vbox)
2. [Prepare base-os virtual disk image and add it to nodes within the compute section of the cluster (i.e., `adminNode` and `computeNode`s)](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-machines-basic)
3. [Configure `adminNode` for NFS and DHCP servers and internet access](https://github.com/lrahmani/lustre-on-virtualbox/tree/master/centos7-frontend-nfs-appliance)
4. [Configure `computeNode`s network](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-client)
5. [Prepare Lustre kernel-modified OS virtual disk images for its servers](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-Servers-(OSS,MGS,MDS))
6. [Configure and deploy Lustre Manager Server (MGS) and Metadata Server (MDS)](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-mgs-mds)
7. [Configure and deploy Lustre Object Storage Servers (OSSs)](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-OSS)
8. [Configure Lustre clients (on `computeNode`s) and test deployed filesystem](https://github.com/lrahmani/lustre-on-virtualbox/wiki/configure-client)

## Glossary

VBox | Oracle's VirtualBox

VM | Virtual Machine

MGS | Luster ManaGer Server

MDS | Lustre MetaData Server

OSS | Lustre Object Storage Server

MGT | Lustre ManaGer Target

MDT | Lustre MetaData Target

OST | Lustre Object Storage Target
