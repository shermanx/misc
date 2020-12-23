#!/bin/sh
#README: setup a mini http server and host a few large blank files for basic speedtest

sudo killall mini_httpd
sudo apt install mini-httpd
mkdir ~/tmp
cd ~/tmp
dd if=/dev/zero of=50.bin bs=25MB count=2
dd if=/dev/zero of=100.bin bs=25MB count=4
mini_httpd -p 50080
echo
echo "*** Please use these to test: "
echo "*** wget http://`dig +short myip.opendns.com @resolver1.opendns.com`:50080/50.bin -v -O 50.bin"
echo "*** wget http://`dig +short myip.opendns.com @resolver1.opendns.com`:50080/100.bin -v -O 100.bin"
echo 

