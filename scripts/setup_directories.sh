## https://github.com/NathanaelGandhi
## Last Modified: 15 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash

echo "[NG] Making 4x parity drive folders at /mnt/parity*";
mkdir -p /mnt/parity0;
mkdir -p /mnt/parity1;
mkdir -p /mnt/parity2;
mkdir -p /mnt/parity3;
echo "[NG] Making 12x data drive folders at /mnt/disk*";
mkdir -p /mnt/disk0;
mkdir -p /mnt/disk1;
mkdir -p /mnt/disk2;
mkdir -p /mnt/disk3;
mkdir -p /mnt/disk4;
mkdir -p /mnt/disk5;
mkdir -p /mnt/disk6;
mkdir -p /mnt/disk7;
mkdir -p /mnt/disk8;
mkdir -p /mnt/disk9;
mkdir -p /mnt/disk10;
mkdir -p /mnt/disk11;

echo "[NG] Making drive folders done";
