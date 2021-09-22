# rpi-nas
Raspberry Pi NAS - Setup instructions &amp; useful setup scrips

## Setup
### Setting up Raspberry Pi
1. Setup Raspberry Pi OS on your SD card - Raspberry Pi Imager.
https://www.raspberrypi.org/software/

2. Enable SSH
Navigate to the boot directory on the SD card and create a blank file called 'ssh'.
```
touch ssh
```

3. Boot the Raspberry Pi
Unmount the SD card and plug it into your Raspberry Pi. Connect your Raspberry Pi to your router. Plug it into power.

4. Find the Pi IP address
```
ping raspberrypi
```
or
```
nmap -sn 192.168.1.0/24
```

5. Connect to your Raspberry Pi
```
ssh pi@raspberrypi
```
Password: raspberry

6. Run the raspi-config tool
```
sudo raspi-config
```
7. Select system options > Password. Change the password for the 'pi' user.
Finish and reboot.

8. ssh into your Raspberry Pi using your new password.

### Setting up software
Install git
```
sudo apt update && sudo apt install git -y

Make a folder to hold your git clones
```
mkdir -p ~/git/rpi-nas
```

Clone this repository
```
git clone https://github.com/NathanaelGandhi/rpi-nas.git ~/git/rpi-nas
```

Run the install script and follow the prompts
```
./git/rpi-nas/install.sh
```

### [Manual Input Required] Adding Harddrives

### [Manual Input Required] Configure snapraid-runner

### [Manual Input Required] Enabling automatic operation (cron)

### [Manual Input Required] Configure syncthing
Follow the official documentation, starting at https://docs.syncthing.net/intro/getting-started.html 'Configuring'.
