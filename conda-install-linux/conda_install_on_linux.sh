#!/bin/sh

# conda_install_on_linux.sh
#
# author: eam
# date: 05.09.23

# Check if Conda is already installed
if command -v conda &>/dev/null; then
    echo "Conda is already installed."
    exit 0
fi

# Change to home directory
cd "$HOME" || exit

# Create a directory for the installer and change to it
mkdir conda_installer && cd conda_installer || exit

# Downloading Anaconda for Linux
CONDA_SH="Anaconda3-2023.07-2-Linux-x86_64.sh"
wget "https://repo.anaconda.com/archive/$CONDA_SH"

# Install Anaconda
bash $CONDA_SH -b -p "$HOME"/anaconda3

# Delete the installer
# rm $CONDA_SH

# Initialize conda for bash shell
"$HOME"/anaconda3/bin/conda init bash

# Source the profile to activate changes
source $HOME/.bashrc

# Complete the installation with bioconda configuration
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

echo "Anaconda and Bioconda configuration completed."



