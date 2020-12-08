#!/bin/sh

#README auto script for xfce desktop to launch apps while making xrdp available for remote desktop

# Check list for new machine:
# 1. check the eth interface for VM
# 2. Disable logout for local debug
# 3.

#Disable for debugging purpose
#exit
##############################


echo "`date` *** startup begins..." >> ~/startup.log
echo "IPs: `ifconfig|grep 192`" >> ~/startup.log

if [ `vboxmanage list runningvms |wc -l` \> 0 ]; then
        echo "`date` VM is running so we do nothing."  >> ~/startup.log
        exit 0;
else
        echo "`date` No VM is runing"  >> ~/startup.log
fi

vboxmanage startvm "openwrt-2cn" --type headless &
vboxmanage startvm "ubuntu-server-20.04" --type headless &

/usr/bin/xfce4-screensaver &
sleep 1
#/usr/bin/xfce4-screensaver-command -l

echo "`date` *** startup completed! Now logout." >> ~/startup.log

xfce4-session-logout -l
