#!/bin/bash

# Install repository epel
echo "[TASK 1] Install repository"
sudo yum install epel-release -y > /dev/null 2>&1
sudo yum update -y > /dev/null 2>&1

# Install mysql
echo "[TASK 2] Install mysql"
sudo yum install epel-release -y > /dev/null 2>&1
sudo yum update -y > /dev/null 2>&1
sudo yum install wget net-tools mc git -y > /dev/null 2>&1
sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
sudo rpm -ivh mysql57-community-release-el7-9.noarch.rpm
sudo yum install mysql-server -y > /dev/null 2>&1

# Install mysql jdbc connector
echo "[TASK 3] Install mysql jdbc connector"
sudo wget https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-8.0.22-1.el7.noarch.rpm -P /tmp
sudo rpm -ivh /tmp/mysql-connector-java-8.0.22-1.el7.noarch.rpm
#check 'rpm -qlp' before set path
connector_path=$(rpm -qlp mysql-connector-java-8.0.22-1.el7.noarch.rpm  | grep jar)

# Enable and run mysql-server
echo "[TASK 4] Enable and run mysql-server"
sudo systemctl start mysqld > /dev/null 2>&1
sudo systemctl enable mysqld > /dev/null 2>&1

# Install liquibase
echo "[TASK 5] Install liquibase"
sudo cd /tmp/ > /dev/null 2>&1
sudo yum install java-1.8.0-openjdk -y > /dev/null 2>&1
# wget to /tmp folder
sudo wget https://github.com/liquibase/liquibase/releases/download/v4.2.2/liquibase-4.2.2.tar.gz -P /tmp
sudo mkdir /tmp/liquibase-4.2.2
sudo cp $connector_path /tmp/liquibase-4.2.2/lib/
sudo tar -xf /tmp/liquibase-4.2.2.tar.gz -C /tmp/liquibase-4.2.2
sudo echo "export PATH=$PATH:/tmp/liquibase-4.2.2" >> ~/.bashrc
source ~/.bashrc

# Set PasswordAuthentication
echo "[TASK 5] Set PasswordAuthentication"
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart > /dev/null 2>&1