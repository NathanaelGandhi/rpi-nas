#!/bin/bash

echo "[NG] Downloading LogMeIn Hamachi from vpn.net";
wget https://www.vpn.net/installers/logmein-hamachi-2.1.0.203-armel.tgz;

echo "[NG] Extracting files"
tar -xvzf logmein-hamachi-*;

echo "[NG] Changing directory to extracted files"
cd logmein-hamachi-*/;

echo "[NG] Running installer"
sudo ./install.sh;

echo "[NG] Changing directory back"
cd ..;

echo "[NG] Removing downloaded hamachi files"
rm -r logmein-hamachi-*;



