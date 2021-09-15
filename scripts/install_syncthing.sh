## https://github.com/NathanaelGandhi
## Last Modified: 15 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash

echo "[NG] Instructions available at https://apt.syncthing.net/";

echo "[NG] Installing apt-transport-https";
sudo apt install apt-transport-https -y;

echo "[NG] Adding the release PGP keys";
sudo curl -s -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg;

echo "[NG] Adding the 'stable' channel to your APT sources";
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list;

echo "Increasing the preference of Syncthing's packages ('pinning')";
printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | sudo tee /etc/apt/preferences.d/syncthing;

echo "[NG] Update and install syncthing"
sudo apt update;
sudo apt install syncthing;

echo "[NG] Installing syncthing done"

