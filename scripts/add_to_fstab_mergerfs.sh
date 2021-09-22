## https://github.com/NathanaelGandhi
## Last Modified: 17 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash
sudo echo "" >> /etc/fstab;
sudo echo "### MERGERFS" >> /etc/fstab;
sudo echo "# This tells Mergerfs to combine all drives at /mnt/disk(1,2,3...etc) and to keep 50gb per drive free (useful for snapraid to function properly)" >> /etc/fstab;
sudo echo "/mnt/disk* /mnt/vault fuse.mergerfs direct_io,defaults,allow_other,minfreespace=50G,fsname=mergerfs 0 0" >> /etc/fstab;

echo "[NG] fstab has been updated with the required template.";
sudo echo "# I am not sure how / if it is safe to automate filling the UUIDs as this is specific to your unique setup." >> /etc/fstab;
echo "[NG] You are required to fill in the UUID of your connected drives manually at /etc/fstab";

