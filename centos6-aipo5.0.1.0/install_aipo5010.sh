#!/bin/bash

cp /usr/share/zoneinfo/Japan /etc/localtime
sed -i 's/^/#/g' /etc/sysconfig/i18n
echo 'LANG="ja_JP.utf8"' >> /etc/sysconfig/i18n
yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget
yum install -y ld-linux.so.2
cd /usr/local/
wget -P /usr/local/ --trust-server-names "https://osdn.jp/frs/redir.php?m=jaist&f=%2Faipo%2F44949%2Faipo5010ja_linux.tar.gz"
tar -xvzf aipo5010ja_linux.tar.gz
cd /usr/local/aipo5010ja_linux
tar -xvzf aipo5010.tar.gz
mv /usr/local/aipo5010ja_linux/aipo /usr/local/
cd /usr/local/aipo/bin
sh installer.sh
sh ./startup.sh