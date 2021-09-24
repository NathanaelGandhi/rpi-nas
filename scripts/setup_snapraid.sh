## https://github.com/NathanaelGandhi
## Last Modified: 24 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash

echo "[NG] Cloning snapraid-runner to ~/git/";
mkdir -p ~/git/snapraid-runner
git clone https://github.com/Chronial/snapraid-runner.git ~/git/snapraid-runner

echo "[NG] Copying snapraid-runner config"
sudo cp ~/git/snapraid-runner/snapraid-runner.conf.example /etc/snapraid-runner.conf

echo "[NG] Setting up snapraid done"
echo "[NG] THERE ARE STILL MANUAL STEPS REQUIRED. READ THE README."
