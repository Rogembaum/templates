#!/bin/bash

# Update hosts file
# HAND MADE ONLY poka chto
#echo "[TASK 1] Update inventory file"
#cat >>/ansible/inventory.ini<<EOF
#ip1 ansible_host=1.1.1.1
#EOF

# Install repository
echo "[TASK 1] Install repository"
yum install epel-release -y > /dev/null 2>&1
yum update -y > /dev/null 2>&1

# Install python
echo "[TASK 2] Install python"
yum install python36 -y > /dev/null 2>&1
pip3 install --upgrade pip > /dev/null 2>&1

# Install ansible
echo "[TASK 3] Install ansible"
pip3 install ansible > /dev/null 2>&1
pip3 install "pywinrm>=0.3.0" > /dev/null 2>&1

# Set PasswordAuthentication
echo "[TASK 4] Set PasswordAuthentication"
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart > /dev/null 2>&1

# Run playbook Install Nexus
echo "[TASK 5] Run playbook Install Nexus"
#sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
#sudo service sshd restart > /dev/null 2>&1