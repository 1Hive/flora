# Configuration
export GO_VER="1.15"

# Disable all interactive prompts
export UCF_FORCE_CONFFOLD=1
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Upgrade system packages
sudo apt-get update
sudo apt-get \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  upgrade -y -q

# Install build-essential
sudo apt-get -y install build-essential git wget

# Install go
mkdir -p /tmp/go
wget https://golang.org/dl/go${GO_VER}.linux-amd64.tar.gz -O /tmp/go/go.tar.gz
tar -xvf /tmp/go/go.tar.gz -C /tmp/go
sudo mv /tmp/go/go /usr/local/bin
chmod +x /usr/local/bin/go
