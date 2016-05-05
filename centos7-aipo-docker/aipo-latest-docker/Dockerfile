FROM centos

RUN DATESTR=`date +%Y%m%d`

RUN echo $DATESTR

RUN /bin/cat /etc/redhat-release 

RUN yum check

RUN yum -y install initscripts

RUN yum swap -y fakesystemd systemd

RUN yum -y update

RUN yum install -y sudo make dbus

RUN yum reinstall -y glibc-common

RUN yum install -y gcc nmap lsof unzip readline-devel zlib-devel wget 

#RUN timedatectl set-timezone Asia/Tokyo

#RUN localectl set-locale LANG=ja_JP.utf8

RUN sed -i 's/^/#/g' /etc/locale.conf

RUN echo 'LANG="ja_JP.utf8"' >> /etc/locale.conf

RUN echo 'LC_CTYPE="ja_JP.utf8"' >> /etc/locale.conf

RUN source /etc/locale.conf

RUN yum install -y git java-1.8.0-openjdk-devel

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk

ENV PATH $PATH:$JAVA_HOME/bin

RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo

RUN yum install -y apache-maven

RUN yum install -y ruby rubygem-rake

# Edit sudoers file
# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

WORKDIR /usr/local/src

RUN git clone https://github.com/aipocom/distribute.git

WORKDIR /usr/local/src/distribute

RUN rake installer:latest

RUN cp /usr/local/src/distribute/target/aipo-latest-${DATESTR}-linux-x64.tar.gz /usr/local/

WORKDIR /usr/local/

RUN tar -xvzf aipo-latest-${DATESTR}-linux-x64.tar.gz

WORKDIR /usr/local/aipo-latest-${DATESTR}-linux-x64

RUN chmod +x ./installer.sh

RUN ./installer.sh

RUN /usr/local/aipo/bin/startup.sh

EXPOSE 80

CMD ["/sbin/init"]
