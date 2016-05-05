FROM centos

RUN /bin/cat /etc/redhat-release 

RUN yum check

RUN yum -y install initscripts

RUN yum swap -y fakesystemd systemd

RUN yum -y update

RUN yum install -y sudo make dbus

RUN yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget 

#RUN timedatectl set-timezone Asia/Tokyo

#RUN localectl set-locale LANG=ja_JP.utf8

# Edit sudoers file
# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

WORKDIR /usr/local/

RUN wget -P /usr/local/ --trust-server-names "https://osdn.jp/frs/redir.php?m=jaist&f=%2Faipo%2F63319%2Faipo-8.0.1a-linux-x64.tar.gz"

RUN tar -xvzf aipo-8.0.1a-linux-x64.tar.gz

WORKDIR /usr/local/aipo-8.0.1-linux-x64

RUN chmod +x ./installer.sh

RUN ./installer.sh

RUN /usr/local/aipo/bin/startup.sh

EXPOSE 80

CMD ["/sbin/init"]
