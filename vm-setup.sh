# To setup a fresh VM environ
# wget https://raw.githubusercontent.com/shermanx/misc/master/vm-setup.sh && chmod +x vm-setup.sh && ./vm-setup.sh

sudo -i
sudo apt update && sudo apt upgrade -y && sudo apt install net-tools speedtest-cli iftop nethogs traceroute curl
curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s full
sudo iptables -L
sudo iptables-save > ~/iptables-rules
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F
sudo iptables -L
sudo iptables-save > ~/iptables-rules.allow-all
bash <(curl -s -L https://git.io/v2ray.sh)
61286
netstat -tanplc |grep 61286
