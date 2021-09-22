## https://github.com/NathanaelGandhi
## Last Modified: 22 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash

cd ~/git/rpi-nas;

echo "[NG] Software recommended to setup your Raspberry Pi NAS:"
echo "[NG] 		SNAPRAID (Software raid/backup)"
echo "[NG] 		SAMBA (network share)"
echo "[NG] 		MERGERFS (Union File System)"
echo "[NG] 		PI TEMPERATURE SCRIPT"
echo "[NG] 		LOGMEIN HAMACHI (VPN)"
echo "[NG] 		SYNCTHING (File Synchronization)"


while true; do
    read -p "[NG] Do you wish to install all software? (select 'no' to individually select software) " yn
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

		# Prompt SAMBA
		while true; do
		    read -p "[NG] Do you wish to install SAMBA?" yn
		    case $yn in
		        [Yy]* ) SAMBA=True; break;;
		        [Nn]* ) SAMBA=false; break;;
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

	echo "[NG] Adding mount points to fstab";
	echo "[NG] Calling scripts/add_to_fstab_snapriad.sh";
	sudo scripts/add_to_fstab_snapraid.sh

	echo "[NG] Installing Snapraid";
	echo "[NG] Calling scripts/install_snapraid.sh";
	sudo scripts/install_snapraid.sh

	echo "[NG] Setting up Snapraid";
	echo "[NG] Calling scripts/setup_snapraid.sh";
	sudo scripts/setup_snapraid.sh
fi

if [ $SAMBA ]; then
	if [ $SNAPRAID ]; then
		echo "[NG] directories & mount points already setup";
	else
		echo "[NG] Creating harddrive mount points";
		echo "[NG] Calling scripts/setup_directories.sh";
		sudo scripts/setup_directories.sh

		echo "[NG] Adding mount points to fstab";
		echo "[NG] Calling scripts/add_to_fstab_snapriad.sh";
		sudo scripts/add_to_fstab_snapraid.sh
	fi

	echo "[NG] Installing Samba";
	echo "[NG] Calling scripts/install_samba.sh";
	sudo scripts/install_samba.sh

	echo "[NG] Setting up Samba";
	echo "[NG] Calling scripts/setup_network_share.sh";
	sudo scripts/setup_network_share.sh
fi

if [ $MERGERFS ]; then
	echo "[NG] Installing Mergerfs";
	echo "[NG] Calling scripts/install_mergerfs.sh";
	sudo scripts/install_mergerfs.sh

	echo "[NG] Adding mergerfs to fstab";
	echo "[NG] Calling scripts/add_to_fstab_mergerfs.sh";
	sudo scripts/add_to_fstab_mergerfs.sh
fi

if [ $TEMP ]; then
	echo "[NG] Adding temperature script to home folder";
	echo "[NG] Calling enable_temp_polling.sh";
	sudo scripts/install_enable_temp_polling.sh
fi

if [ $HAMACHI ]; then
	echo "[NG] Installing LogMeIn Hamachi";
	echo "[NG] Calling scripts/install_hamachi.sh";
	sudo scripts/install_hamachi.sh

	echo "[NG] Setting up LogMeIn Hamachi";
	echo "[NG] Calling scripts/setup_hamachi.sh";
	sudo scripts/setup_hamachi.sh
fi

if [ $SYNCTHING ]; then
	echo "[NG] Installing Syncthing";
	echo "[NG] Calling scripts/install_syncthing.sh";
	sudo scripts/install_syncthing.sh
fi

echo "[NG] Everything you have selected has been installed, please follow the remaining manual steps found at https://github.com/NathanaelGandhi/rpi-nas"

