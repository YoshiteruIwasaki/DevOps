#!/bin/bash

yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget
yum install -y ld-linux.so.2
cd /usr/local/
wget -P /usr/local/ --trust-server-names "https://osdn.jp/frs/redir.php?m=jaist&f=%2Faipo%2F60145%2Faipo6010ja_linux.tar.gz"
tar -xvzf aipo6010ja_linux.tar.gz
tar -xvzf aipo6010.tar.gz
cd /usr/local/aipo/bin
sh installer.sh
sh ./startup.sh