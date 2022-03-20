#!/bin/bash

# Install repository epel
echo "[TASK 1] Install repository"
sudo yum install epel-release -y > /dev/null 2>&1
sudo yum update -y > /dev/null 2>&1

# Install java
echo "[TASK 2] Install java"
sudo yum install java-1.8.0-openjdk-headless.x86_64 -y > /dev/null 2>&1

# Install tools
echo "[TASK 3] Install pwgen"
sudo yum install pwgen mc net-tools -y > /dev/null 2>&1

#Installing repo MongoDB 
echo "[TASK 4] Installing repo MongoDB"
cat >>/etc/yum.repos.d/mongodb-org.repo<<EOF
[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc
EOF

#Installing service MongoDB 
echo "[TASK 5] Installing service MongoDB"
sudo yum install mongodb-org -y > /dev/null 2>&1

#Enable and start service MongoDB 
echo "[TASK 6] Enable and start service MongoDB"
sudo systemctl daemon-reload > /dev/null 2>&1
sudo systemctl enable mongod.service > /dev/null 2>&1
sudo systemctl start mongod.service > /dev/null 2>&1
# sudo systemctl --type=service --state=active | grep mongod

#Elasticsearch install
echo "[TASK 7] Elasticsearch install"
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch > /dev/null 2>&1
cat >>/etc/yum.repos.d/elasticsearch.repo<<EOF
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/oss-7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
sudo yum install elasticsearch-oss -y > /dev/null 2>&1

#Elasticsearch configuring
echo "[TASK 8] Elasticsearch configuring"
sudo tee -a /etc/elasticsearch/elasticsearch.yml > /dev/null <<EOT
cluster.name: graylog
action.auto_create_index: false
EOT

#Enable and start service Elasticsearch
echo "[TASK 9] Enable and start service Elasticsearch"
sudo systemctl daemon-reload > /dev/null 2>&1
sudo systemctl enable elasticsearch.service > /dev/null 2>&1
sudo systemctl restart elasticsearch.service > /dev/null 2>&1

#Install and conf Graylog
echo "[TASK 10] Install and conf Graylog"
sudo rpm -Uvh https://packages.graylog2.org/repo/packages/graylog-4.0-repository_latest.rpm > /dev/null 2>&1
#sudo yum update && sudo yum install graylog-server graylog-enterprise-plugins graylog-integrations-plugins graylog-enterprise-integrations-plugins > /dev/null 2>&1
sudo yum install graylog-server -y > /dev/null 2>&1

#Graylog configuring password and bind_address
echo "[TASK 10] Graylog configuring password"
gray_pass=`pwgen -N 1 -s 16`
echo "###############################"
echo "GRAYLOG PASSWORD "$gray_pass
echo "###############################"
gray_pass_sha2=`echo -n $gray_pass | sha256sum | cut -d" " -f1`
sudo sed -i 's/^password_secret =/password_secret = '$gray_pass'/' /etc/graylog/server/server.conf
sudo sed -i 's/^root_password_sha2 =/root_password_sha2 = '$gray_pass_sha2'/' /etc/graylog/server/server.conf
sudo sed -i 's/^#http_bind_address = 127.0.0.1:9000/http_bind_address = 0.0.0.0:9000/' /etc/graylog/server/server.conf

#Enable and start service Graylog
echo "[TASK 11] Enable and start service Graylog"
sudo systemctl daemon-reload > /dev/null 2>&1
sudo systemctl enable graylog-server.service > /dev/null 2>&1
sudo systemctl start graylog-server.service > /dev/null 2>&1

# Disable SELinux
echo "[TASK 12] Disable SELinux"
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

# Stop and disable firewalld
echo "[TASK 13] Stop and Disable firewalld"
systemctl disable firewalld >/dev/null 2>&1
systemctl stop firewalld >/dev/null 2>&1

# Enable ssh password authentication
echo "[TASK 14] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd > /dev/null 2>&1