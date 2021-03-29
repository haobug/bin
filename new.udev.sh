#!/bin/bash
in=${1:-abcd:1234}
vid=$(echo $in|cut -d':' -f1)
pid=$(echo $in|cut -d':' -f2)
cat>new.udev.rule<<EOF
SUBSYSTEM=="usb", ATTR{idVendor}=="$vid", ATTR{idProduct}=="$pid", MODE="0666", GROUP="plugdev"
EOF

cat /etc/udev/rules.d/51-android.rules new.udev.rule |sort|uniq|sudo tee /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules && \
sudo udevadm trigger

sudo `which adb` kill-server
adb kill-server

adb devices
fastboot devices
if [ -r new.udev.rule ];
then
    rm -f new.udev.rule
fi
