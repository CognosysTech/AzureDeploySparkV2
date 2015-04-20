#!/bin/bash

### Cognosys Technologies
### 
### Warning! This script partitions and formats disk information be careful where you run it
###          This script is currently under development and has only been tested on Ubuntu images in Azure
###          This script is not currently idempotent and only works for provisioning at the moment

### Remaining work items
### -Alternate discovery options (Azure Storage)
### -Implement Idempotency and Configuration Change Support
### -Implement OS Disk Striping Option (Currenlty using multiple spark data paths)
### -Implement Non-Durable Option (Put data on resource disk)
### -Configure Work/Log Paths
### -Recovery Settings (These can be changed via API)

echo "Setup"

# TEMP FIX - Re-evaluate and remove when possible
# This is an interim fix for hostname resolution in current VM

  echo "10.0.0.10 slave0" >> /etc/hosts
  echo "10.0.0.11 slave1" >> /etc/hosts
  echo "10.0.0.12 slave2" >> /etc/hosts

cd /usr/local/spark/conf
echo "slave0" >> slaves
echo "slave1" >> slaves
echo "slave2" >> slaves

cd /usr/local/spark/sbin

./start-master.sh
./start-slaves.sh

#========================= END ==================================

