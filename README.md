# rpi-nas
Raspberry Pi NAS - Setup instructions &amp; useful setup scrips.
Recommended: Raspberry Pi 4B (1gb RAM per 16TB data)

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

4. Find the IP address of your Raspberry Pi
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
1. Install git
```
sudo apt update && sudo apt install git -y
```

2. Make a folder to hold your git clones
```
mkdir -p ~/git/rpi-nas
```

3. Clone this repository
```
git clone https://github.com/NathanaelGandhi/rpi-nas.git ~/git/rpi-nas
```

4. Run the install script and follow the prompts
```
./git/rpi-nas/install.sh
```

### [Manual Input Required] Adding Harddrives
1. List block devices with output info about filesystems (-f)
```
lsblk -f
```

2. Plug in a harddrive.<br/>
If it is not formatted, now is a good time. (swap DEVICE below for the device path, eg. /dev/sdd)

2a. Format Parity Disks Using
```
mkfs.ext4 -m 0 -T largefile4 DEVICE
```

2b. Format Data Disks Using
```
mkfs.xfs DEVICE
```


3. Rerun list block devices to find the UUID of the newly added harddrive
```
lsblk -f
```

4. Add your harddrive UUIDs to fstab (/etc/fstab) in the provided location (uncomment lines as required)
```
sudo nano /etc/fstab
```

5. Repeat steps 2-4 as required

6. Reboot
```
sudo reboot
```

### [Manual Input Required] Configure snapraid-runner
1. Edit the snapraid-runner config file
```
sudo nano ~/etc/snapraid-runner.conf
```
Fill in your EMAIL and SMTP details to enable email feedback from runs.
You can use gmail accounts as SMTP, however I'll leave that up to you to research / evaluate

### [Manual Input Required] Enabling automatic operation (cron)
1. Open crontab by running
```
sudo crontab -e
```

2. Add the following to run the snapraid-runner script every night at 3:00am
```
0 3 * * * python ~/git/snapraid-runner/snapraid-runner.py --conf ~/etc/snapraid-runner.conf
```
checkout https://crontab.guru to learn how to pick different times

### [Manual Input Required] Configure syncthing
1. Follow the official documentation, starting at https://docs.syncthing.net/intro/getting-started.html 'Configuring'.
