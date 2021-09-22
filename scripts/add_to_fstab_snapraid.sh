## https://github.com/NathanaelGandhi
## Last Modified: 17 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash
sudo echo "" >> /etc/fstab
sudo echo "### SNAPRAID" >> /etc/fstab;
sudo echo "##Format Parity Disks Using: mkfs.ext4 -m 0 -T largefile4 DEVICE" >> /etc/fstab;
sudo echo "##Format Data Disks Using: mkfs.xfs DEVICE" >> /etc/fstab;
sudo echo "" >> /etc/fstab;
sudo echo "## Vault1 (8-disk)" >> /etc/fstab;
sudo echo "# You need to find and provide each drives UUID below. This allows fstab to mount the same drive at the same location everytime, regardless of the physical drive bay used." >> /etc/fstab;
sudo echo "#UUID=  /mnt/parity0   ext4    defaults        0       0       #Pos1: ?TB BRAND MODEL" >> /etc/fstab;
sudo echo "#UUID=  /mnt/parity1   ext4    defaults        0       0       #Pos2:" >> /etc/fstab;
sudo echo "UUID=   /mnt/disk0   xfs     defaults        0       0       #Pos3:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk1   xfs     defaults        0       0       #Pos4:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk2   xfs     defaults        0       0       #Pos5:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk3   xfs     defaults        0       0       #Pos6:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk4   xfs     defaults        0       0       #Pos7:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk5   xfs     defaults        0       0       #Pos8:" >> /etc/fstab;
sudo echo "" >> /etc/fstab;
sudo echo "## Vault2 (8-disk)" >> /etc/fstab;
sudo echo "#UUID=  /mnt/parity2   ext4    defaults        0       0       #PosX:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/parity3   ext4    defaults        0       0       #PosX:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk6   xfs     defaults        0       0       #PosX:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk7   xfs     defaults        0       0       #PosX:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk8   xfs     defaults        0       0       #PosX:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk9   xfs     defaults        0       0       #PosX:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk10   xfs     defaults        0       0       #PosX:" >> /etc/fstab;
sudo echo "#UUID=  /mnt/disk11   xfs     defaults        0       0       #PosX:" >> /etc/fstab;
