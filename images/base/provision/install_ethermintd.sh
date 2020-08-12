# Clone repository
mkdir -p /tmp/ethermint
cd /tmp/ethermint
git clone https://github.com/ChainSafe/ethermint.git
cd ethermint
GOPATH=/usr/local/go make install
