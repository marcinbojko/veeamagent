# Veeam Agent for Windows

## Description

Availability for the public cloud and physical workloads
Avoid downtime and data loss quickly and easily for Windows-based physical or public cloud-based workloads!
Introducing NEW Veeam® Agent for Microsoft Windows, providing backup and recovery for physical and cloud-based servers and workstations, as well as for endpoint devices that belong to remote users.

## Supported Operating System

* Microsoft Windows 7 SP1
* Microsoft Windows 8.x
* Microsoft Windows 10
* Microsoft Windows Server 2008 R2 SP1
* Microsoft Windows Server 2012
* Microsoft Windows Server 2012 R2
* Microsoft Windows Server 2016
* Microsoft Windows 10 April 2018 Update
* Microsoft Windows Server 1803

## Hardware requirements

* CPU: x86-64 processor architecture.
* Memory: 2 GB RAM.
* Disk Space: 150 MB for product installation.
* Network: 1 Mbps or faster. High latency and reasonably unstable WAN links are supported.
* System firmware: BIOS or UEFI.
* Drive encryption: Microsoft BitLocker (optional)

## Backup Target

* Local (internal) storage of the protected computer (not recommended)
* Direct attached storage (DAS), such as USB, eSATA or Firewire external drives
* Network Attached Storage (NAS) able to represent itself as SMB (CIFS) share
* Veeam Backup & Replication 9.5 Update 1 backup repository
* Veeam Backup Cloud Connect 9.5 Update 1 backup repository

## Features

* Install and uninstall via Chocolatey
* Requires source path to MyGet
* Supports only 64-bit version

## Changelog

### 2018-07-11 Build 2.2.0.589

* version 2.2.0.589

### 2018-05-07 Build 2.1.0.423 (20180507)

* rebuild for new GCP links

### 2017-12-21 Build 2.1.0.423

* version 2.1.0.423

### 2017-03-18 Build 2.0.0.594

* initial build
* version 2.0.0.594

## Usage

### Direct

```cmd
choco install veeamagent -y
```

### YAML

```yaml
veeamagent:
  ensure: latest
  uninstall_options: "--force --all-versions"
  provider: chocolatey
```

or

```yaml
veeamagent:
  ensure: latest
```
