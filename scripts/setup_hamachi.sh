## https://github.com/NathanaelGandhi
## Last Modified: 15 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash

echo "Enter your hamachi email address"
read hamachi_email

echo "Enter your hamachi nickname"
read hamachi_nickname

echo "[NG] Copying hamachi user permission override file to system"
sudo cp ../files/hamachi/h2-engine-override.cfg /var/lib/logmein-hamachi/h2-engine-override.cfg;

echo "[NG] Starting hamachi"
sudo /etc/init.d/logmein-hamachi start;

echo "[NG] Waiting to login..."
sleep 2;

echo "[NG] Logging in"
hamachi login;

echo "[NG] Setting hamachi nickname"
hamachi set-nick $hamachi_nickname;

echo "[NG] Attaching to your hamachi email address"
hamachi attach $hamachi_email;

echo "[NG] Printing status"
hamachi;

echo "[NG] Hamachi setup finished - check output to confirm everything ran as expected"
