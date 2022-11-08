#!/bin/sh

#  install.sh
#  BCL-converter_install
#
#  Created by eam on 08.11.22.
#  

set -e
set -u
set -o pipefail

# Simple script to convert and install the rpm package bcl-convert
# from Illumina on Ubuntu 22.04.

sudo apt-get update
sudo apt-get upgrade

sudo apt install alien

mkdir ./pkg_tools
cd pkg_tools

# Download bcl-convert pkg
wget -c https://webdata.illumina.com/downloads/software/bcl-convert/bcl-convert-4.0.3-2.el7.x86_64.rpm

# Convert rpm pkg to debian
sudo alien -d bcl-convert-4.0.3-2.el7.x86_64.rpm

# Install pkg (default installation dir -> /usr/bin/)
sudo dpkg -i bcl-convert_4.0.3*.deb 

# complete installation and required dependences
# sudo apt-get -f install

echo "Completed!"

