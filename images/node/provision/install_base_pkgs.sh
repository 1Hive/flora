# Configuration
export GO_VER="1.15"

# Disable all interactive prompts
export UCF_FORCE_CONFFOLD=1
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections


# Install build-essential
sudo apt-get update
sudo apt-get -y install build-essential git wget

# Upgrade system packages
sudo apt-get \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  upgrade -y -q

# Install go
mkdir -p /usr/local/go/bin
sudo apt-get -y install golang
go version
go env
