## https://github.com/NathanaelGandhi
## Last Modified: 15 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash

echo "[NG] Copying snapraid.conf to /etc/";
sudo cp ../files/snapraid/snapraid.conf /etc/snapraid.conf;

echo "[NG] Cloning snapraid-runner to ~/git/";
mkdir -p ~/git
git clone https://github.com/Chronial/snapraid-runner.git ~/git/snapraid-runner

echo "[NG] Copying snapraid-runner config - TODO"


echo "[NG] Adding snapraid-runner to cron - TODO"

echo "[NG] Setting up snapraid done"
