#!/bin/bash

timedatectl set-timezone Asia/Tokyo
localectl set-locale LANG=ja_JP.utf8
DATESTR=`date +%Y%m%d`
yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget
yum install -y git java-1.8.0-openjdk-devel
wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
yum install -y apache-maven
yum install -y ruby rubygem-rake

# Aipo Distribute
cd /usr/local/src
git clone https://github.com/aipocom/distribute.git
cd distribute
rake installer:latest
cp /usr/local/src/distribute/target/aipo-latest-${DATESTR}-linux-x64.tar.gz /usr/local/

# Install Aipo
cd /usr/local/
tar -xvzf aipo-latest-${DATESTR}-linux-x64.tar.gz
cd aipo-latest-${DATESTR}-linux-x64
sh installer.sh
/usr/local/aipo/bin/startup.sh