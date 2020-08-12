# Disable the built-in Network Time Protocol
timedatectl set-ntp no

# Install NTPD
sudo apt-get install ntp -y -q
