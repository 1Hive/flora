# Create user
adduser --disabled-password --gecos "" node

# Create .bash_profile
echo '
export GOPATH=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
' > /home/node/.bash_profile
