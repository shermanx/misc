

sudo -i
sudo apt update && sudo apt upgrade -y && sudo apt install net-tools speedtest-cli iftop nethogs
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