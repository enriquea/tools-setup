#!/bin/sh

#  install.sh
#  BCL-converter_install
#
#  Created by eam on 08.11.22.
#  

set -e
set -u
set -o pipefail

# Simple script to convert and install the rpm package bcl2fastq2
# from Illumina on Ubuntu 22.04.

sudo apt-get update
sudo apt-get upgrade

sudo apt install alien

# unzip bcl2fastq2
unzip ./pkg_rpm/bcl2fastq2-v2-20-0-linux-x86-64.zip

# Convert rpm pkg to debian
sudo alien -d ./pkg_rpm/bcl2fastq2-v2.20.0.422-Linux-x86_64.rpm

# Install pkg (default installation dir -> /usr/bin/)
sudo dpkg -i ./pkg_rpm/bcl2fastq2-v2.20.0*.deb

# complete installation and required dependencies
# sudo apt-get -f install

echo "Completed!"

