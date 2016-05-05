#!/bin/bash

cp /usr/share/zoneinfo/Japan /etc/localtime
sed -i 's/^/#/g' /etc/sysconfig/i18n
echo 'LANG="ja_JP.utf8"' >> /etc/sysconfig/i18n
yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget
cd /usr/local/
wget -P /usr/local/ --trust-server-names "https://osdn.jp/frs/redir.php?m=iij&f=%2Faipo%2F64847%2Faipo-8.1.1-linux-x64.tar.gz"
tar -xvzf aipo-8.1.1-linux-x64.tar.gz
cd aipo-8.1.1-linux-x64
sh installer.sh
/usr/local/aipo/bin/startup.sh