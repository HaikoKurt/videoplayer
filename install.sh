#! /bin/bash

# add configuration to boot config to start / stop with Pin3 to ground
ADDCONFIG='dtoverlay=gpio-shutdown,gpio_pin=3,active_low=1,gpio_pull=up'
FILE=/boot/config.txt
if ! grep -q "$ADDCONFIG" "$FILE"; then
    sed -i.bak -e $'$ a\\\n\\n'"\\$ADDCONFIG" $FILE
fi

# update system
sudo apt update -y
sudo apt upgrade -y

# install omxplayer and usbmount
sudo apt install omxplayer -y
sudo apt install usbmount -y

# enable usbmount
sudo mkdir /etc/systemd/system/systemd-udevd.service.d
sudo cp system/videoplayer-usbmount.conf /etc/systemd/system/systemd-udevd.service.d
sudo systemctl daemon-reexec
sudo service systemd-udevd restart

# copy start script and make executable
cp system/start.sh /home/pi
chmod +x /home/pi/start.sh

# install and start service
sudo cp system/videoplayer.service /lib/systemd/system/
sudo systemctl enable videoplayer.service
sudo systemctl start videoplayer.service
