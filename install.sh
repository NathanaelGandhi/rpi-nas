\## https://github.com/NathanaelGandhi
## Last Modified: 15 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash

echo "[NG] Software recommended to setup your Raspberry Pi NAS:"
echo "[NG] 	SNAPRAID (Software raid/backup)"
echo "[NG] 	MERGERFS (Union File System)"
echo "[NG] 	PI TEMPERATURE SCRIPT"
echo "[NG] 	LOGMEIN HAMACHI (VPN)"
echo "[NG] 	SYNCTHING (File Synchronization)"


while true; do
    read -p "[NG] Do you wish to install all software? (select 'no' to individually select software)" yn
    case $yn in
        [Yy]* ) 
		SNAPRAID=true; 
		MERGERFS=true;
		TEMP=true;
		HAMACHI=true;
		SYNCTHING=true;
		break;;
        [Nn]* ) 
		# Prompt SNAPRAID
		while true; do
		    read -p "[NG] Do you wish to install SNAPRAID?" yn
		    case $yn in
		        [Yy]* ) SNAPRAID=True; break;;
		        [Nn]* ) SNAPRAID=false; break;;
		        * ) echo "Please answer yes or no.";;
		    esac
		done

		# Prompt MERGERFS
		while true; do
                    read -p "[NG] Do you wish to install MERGERFS?" yn
                    case $yn in
                        [Yy]* ) MERGERFS=true; break;;
                        [Nn]* ) MERGERFS=false; break;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done

		# Prompt TEMP
                while true; do
                    read -p "[NG] Do you wish to install MERGERFS?" yn
                    case $yn in
                        [Yy]* ) TEMP=true; break;;
                        [Nn]* ) TEMP=false; break;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done

		# Prompt HAMACHI
                while true; do
                    read -p "[NG] Do you wish to install HAMACHI?" yn
                    case $yn in
                        [Yy]* ) HAMACHI=true; break;;
                        [Nn]* ) HAMACHI=false; break;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done

		# prompt SYNCTHING
                while true; do
                    read -p "[NG] Do you wish to install SYNCTHING?" yn
                    case $yn in
                        [Yy]* ) SYNCTHING=true; break;;
                        [Nn]* ) SYNCTHING=false; break;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done

		break;;
        * ) echo "Please answer yes or no.";;
    esac
done

if [ $SNAPRAID ]; then
	echo "[NG] Creating harddrive mount points";
	echo "[NG] Calling scripts/setup_directories.sh";
	sudo scripts/setup_directories.sh
	echo "[NG] Calling scripts/install_snapraid.sh";
	sudo scripts/install_snapraid.sh
	echo "[NG] Calling scripts/setup_snapraid.sh";
	sudo scripts/setup_snapraid.sh
fi

if [ $MERGERFS ]; then
	echo "[NG] Calling scripts/install_mergerfs.sh";
	sudo scripts/install_mergerfs.sh
fi

if [ $TEMP ]; then
	echo "[NG] Calling enable_temp_polling.sh";
	sudo scripts/install_enable_temp_polling.sh
fi

if [ $HAMACHI ]; then
	echo "[NG] Calling scripts/install_hamachi.sh";
	sudo scripts/install_hamachi.sh
fi

if [ $SYNCTHING ]; then
	echo "[NG] Calling scripts/install_syncthing.sh";
	sudo scripts/install_syncthing.sh
fi
