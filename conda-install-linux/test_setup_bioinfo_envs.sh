#!/bin/sh

# test_setup_bioinfo_envs.sh
#
# author: eam
# date: 06.09.23

# Complete the installation with bioconda configuration
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

# Create environment named bioinfo
conda create -n bioinfo

# Activate the environment
conda activate bioinfo

# Install packages bwa and gatk
conda install -c bioconda bwa gatk4