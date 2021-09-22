## https://github.com/NathanaelGandhi
## Last Modified: 22 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash
sudo echo "[vault]" >> /etc/samba/smb.conf;
sudo echo "path = /mnt/vault" >> /etc/samba/smb.conf;
sudo echo "writeable=Yes" >> /etc/samba/smb.conf;
sudo echo "create mask=0777" >> /etc/samba/smb.conf;
sudo echo "directory mask=0777" >> /etc/samba/smb.conf;
while true; do
	read -p "[NG] Do you wish to require user login to access the share?" yn
        case $yn in
        	[Yy]* ) ADDUSER=1; >> /etc/samba/smb.conf; break;;
                [Nn]* ) ADDUSER=1; >> /etc/samba/smb.conf; break;;
                * ) echo "Please answer yes or no.";;
        esac
done

if [ $ADDUSER -eq 1 ]; then
	sudo echo "public=no" >> /etc/samba/smb.conf;
	read -p 'Adding Samba user: ' USERNAME;
	sudo smbpasswd -a $USERNAME;
else
	sudo echo "public=yes" >> /etc/samba/smb.conf;
fi
echo "Restarting smbd";
sudo systemctl restart smbd
echo "Printing IP Address";
hostname -I;
