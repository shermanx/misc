# To setup a fresh VM environ
# wget https://raw.githubusercontent.com/shermanx/misc/master/vm-setup.sh -O vm-setup.sh && chmod +x vm-setup.sh && ./vm-setup.sh

echo "Update and Install? (y/N):"
read cmd
if [ "$cmd" = "y" ]; then
  sudo apt update && sudo apt upgrade -y && sudo apt install net-tools speedtest-cli iftop nethogs traceroute curl vnstat -y
fi
# curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s full
# wget -qO- git.io/besttrace | bash

echo "Setup bash profile? (y/N):"
read cmd
if [ "$cmd" = "y" ]; then
  echo What\'s your server name?
  read sid
  curl https://raw.githubusercontent.com/shermanx/misc/master/.profile |sed 's/YOUR_SERVER_ID/$sid/g' > .profile
fi

#reset iptables
sudo iptables -L
sudo iptables-save > ~/iptables-rules
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F
sudo iptables -L
sudo iptables-save > ~/iptables-rules.allow-all

#install v2ray
sudo -i
bash <(curl -s -L https://git.io/v2ray.sh)
#port 61286

#Monitor
netstat -tanplc |grep 61286
