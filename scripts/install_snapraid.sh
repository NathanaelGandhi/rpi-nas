#!/bin/bash

# Download snapraid into the current directory
wget https://github.com/amadvance/snapraid/releases/download/v11.5/snapraid-11.5.tar.gz &&

## Official instructions: https://github.com/amadvance/snapraid/blob/master/INSTALL 
# Unpack snapraid
tar xf snapraid-*.tar.gz;

# Change directories into the extracted folder
cd snapraid-*/;

# Run configure
./configure;

# Make
make;

# Check for correctness
## This takes a long time and will probably scare new users. If you wish to enable it please uncomment the below lines.
#make check;
## You will need to change back into the snapraid extracted folder for the next step

# Install snapraid
sudo make install

