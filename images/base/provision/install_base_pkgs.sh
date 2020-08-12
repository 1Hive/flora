# Configuration
export GO_VER="1.15"
export DEBIAN_FRONTEND=noninteractive

# Upgrade system packages
sudo apt-get update
sudo apt-get -y upgrade

# Install build-essential
sudo apt-get -y install build-essential git wget

# Install go
mkdir -p /tmp/go
wget https://golang.org/dl/go${GO_VER}.linux-amd64.tar.gz -O /tmp/go/go.tar.gz
tar -xvf /tmp/go/go.tar.gz -C /tmp/go
sudo mv /tmp/go/go /usr/local/bin
chmod +x /usr/local/bin/go
