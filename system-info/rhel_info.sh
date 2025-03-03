#!/bin/sh

# rhel_info.sh
#
# This script is used to get information about the RHEL version, available
# resources and installed packages.
#

echo "General system information:"
uname -a
echo

echo "Detailed hardware information:"
sudo lshw
echo

echo "CPU information:"
lscpu
echo

echo "Memory information:"
free -h
echo

echo "Disk information:"
lsblk
echo

echo "Disk usage:"
df -h
echo

echo "Network information:"
ip addr
echo

echo "Routing table:"
ip route
echo

echo "OS and distribution information:"
cat /etc/os-release
echo

# echo "Installed packages:"
# rpm -qa
# echo

# echo "Running processes:"
# ps aux
# echo
