#!/bin/bash

echo ''
echo '===================================================================='
echo '===================== Disabling SELinux & Update ==================='
echo '===================================================================='
echo ''
sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
sudo yum -y update

echo ''
echo '===================================================================='
echo '================== Reboot, wait for the next step =================='
echo '===================================================================='
echo ''
sudo /sbin/shutdown -r +1
