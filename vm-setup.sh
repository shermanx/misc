# To setup a fresh VM environ
# wget https://raw.githubusercontent.com/shermanx/misc/master/vm-setup.sh && chmod +x vm-setup.sh && ./vm-setup.sh

sudo -i
sudo apt update && sudo apt upgrade -y && sudo apt install net-tools speedtest-cli iftop nethogs traceroute curl
curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s full

#reset iptables
sudo iptables -L
sudo iptables-save > ~/iptables-rules
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F
sudo iptables -L
sudo iptables-save > ~/iptables-rules.allow-all

#install v2ray
bash <(curl -s -L https://git.io/v2ray.sh)
#port 61286

#Monitor
netstat -tanplc |grep 61286
