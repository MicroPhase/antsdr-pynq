
read -d '' PACKAGES <<EOT
libssl-dev
flex
bison
u-boot-tools
EOT
set -e

sudo dpkg --add-architecture i386
sudo apt-get update
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/ppa
sudo apt-get update
sudo apt-get install -y $PACKAGES

wget https://github.com/dgibson/dtc/archive/v1.4.4.tar.gz
tar -xzf v1.4.4.tar.gz
rm v1.4.4.tar.gz
cd dtc-1.4.4
make
cd ..