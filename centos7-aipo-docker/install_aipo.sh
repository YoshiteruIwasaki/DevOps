#!/bin/bash

timedatectl set-timezone Asia/Tokyo
localectl set-locale LANG=ja_JP.utf8
yum install -y epel-release
yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget git
# install jdk
yum install -y java-1.8.0-openjdk-devel
# install maven
wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
yum install -y apache-maven
# build aipo
cd /usr/local/src
git clone https://github.com/aipocom/aipo.git
cd aipo
mvn install
cp -f /usr/local/src/aipo/war/target/aipo.war /docker_data/tomcat
cp -f /usr/local/src/aipo/oms/src/main/webapp/WEB-INF/datasource/dbcp-org001.properties /docker_data/tomcat
sed -i -e "s/localhost/app-db/g" /docker_data/tomcat/dbcp-org001.properties
cp -f /usr/local/src/aipo/sql/postgres/org001.sql /docker_data/postgres
# install Docker
yum -y remove docker docker-common container-selinux
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
yum install -y docker-engine
systemctl start docker
systemctl enable docker
# install Docker Compose
curl -L https://github.com/docker/compose/releases/download/1.11.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# setup Docker Compose
cd /docker_data
docker-compose up -d
# install tomcat
#yum install -y tomcat
# install PostgreSQL
#yum install -y http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-redhat94-9.4-1.noarch.rpm
#yum groupinstall -y "PostgreSQL Database Server 9.4 PGDG"
# setup PostgreSQL
#/usr/pgsql-9.4/bin/postgresql94-setup initdb
#systemctl enable postgresql-9.4.service
#systemctl start postgresql-9.4.service