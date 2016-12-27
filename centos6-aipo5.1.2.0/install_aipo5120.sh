#!/bin/bash

cp /usr/share/zoneinfo/Japan /etc/localtime
sed -i 's/^/#/g' /etc/sysconfig/i18n
echo 'LANG="ja_JP.utf8"' >> /etc/sysconfig/i18n
yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget
yum install -y ld-linux.so.2
cd /usr/local/
wget -P /usr/local/ --trust-server-names "https://ja.osdn.net/frs/redir.php?m=iij&f=%2Faipo%2F60144%2Faipo5120ja_linux.tar.gz"
tar -xvzf aipo5120ja_linux.tar.gz
cd /usr/local/aipo5120ja_linux
tar -xvzf aipo5120.tar.gz
mv /usr/local/aipo5120ja_linux/aipo /usr/local/
cd /usr/local/aipo/bin
sh installer.sh
sh ./startup.sh