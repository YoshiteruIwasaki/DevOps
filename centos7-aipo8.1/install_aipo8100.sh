#!/bin/bash


timedatectl set-timezone Asia/Tokyo
localectl set-locale LANG=ja_JP.utf8
yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget
cd /usr/local/
wget -P /usr/local/ --trust-server-names "https://osdn.jp/frs/redir.php?m=jaist&f=%2Faipo%2F64557%2Faipo-8.1.0-linux-x64.tar.gz"
tar -xvzf aipo-8.1.0-linux-x64.tar.gz
cd aipo-8.1.0-linux-x64
sh installer.sh
/usr/local/aipo/bin/startup.sh