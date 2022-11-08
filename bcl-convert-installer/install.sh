#!/bin/sh

#  install.sh
#  BCL-converter_install
#
#  Created by eam on 08.11.22.
#  

set -e
set -u
set -o pipefail

# Description here

sudo apt-get update
sudo apt-get upgrade

sudo apt install alien

mkdir ./pkg_tools
cd pkg_tools

# Download bcl-convert pkg
wget -c https://webdata.illumina.com/downloads/software/bcl-convert/bcl-convert-4.0.3-2.el7.x86_64.rpm

# Convert rpm pkg to debian
sudo alien -d bcl-convert-4.0.3-2.el7.x86_64.rpm

# Install pkg (default installation dir -> /usr/bin)
sudo alien -i bcl-convert-4.0.3-2.el7.x86_64.deb

rm ./*.deb

echo "Completed!"

