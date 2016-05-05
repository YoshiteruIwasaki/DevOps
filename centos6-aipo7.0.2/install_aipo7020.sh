#!/bin/bash

cp /usr/share/zoneinfo/Japan /etc/localtime
sed -i 's/^/#/g' /etc/sysconfig/i18n
echo 'LANG="ja_JP.utf8"' >> /etc/sysconfig/i18n
yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget
yum install -y ld-linux.so.2
cd /usr/local/
wget -P /usr/local/ --trust-server-names "https://osdn.jp/frs/redir.php?m=iij&f=%2Faipo%2F60038%2Faipo7020aja_linux64.tar.gz"
tar -xvzf aipo7020aja_linux64.tar.gz
tar -xvzf aipo7020aja_linux/aipo7020.tar.gz
cd /usr/local/aipo/bin
sh installer.sh
sh ./startup.sh