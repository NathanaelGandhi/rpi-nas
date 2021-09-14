#!/bin/bash

wget https://www.vpn.net/installers/logmein-hamachi-2.1.0.203-armel.tgz;

tar -xvzf logmein-hamachi-*;

rm -r logmein-hamachi-*.tgz;

cd logmein-hamachi-*/;

sudo ./install.sh;

cd ..;

rm -r logmein-hamachi-*;



