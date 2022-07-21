#!/bin/bash

sudo yum update -y
sudo yum install -y pcre2-devel.x86_64 python gcc python3-devel tzdata curl unzip bash htop

# LOCUST
export LOCUST_VERSION="2.10.1"
sudo pip3 install locust==$LOCUST_VERSION
echo y | sudo yum install postgresql postgresql-devel python-devel
sudo yum install -y amazon-linux-extras
sudo amazon-linux-extras install postgresql10
sudo pip3 install psycopg2=="2.9.3"
sudo pip3 install boto3=="1.24.32"

export PRIVATE_IP=$(hostname -I | awk '{print $1}')
echo "PRIVATE_IP=$PRIVATE_IP" >> /etc/environment

source ~/.bashrc

mkdir -p ~/.ssh
echo 'Host *' > ~/.ssh/config
echo 'StrictHostKeyChecking no' >> ~/.ssh/config

touch /tmp/finished-setup
