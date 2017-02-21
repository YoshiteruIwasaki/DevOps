#https://hub.docker.com/_/tomcat/
FROM tomcat:7-jre8
MAINTAINER aipo

ENV JDBC_MYSQL_VERSION=5.1.39 \
    JDBC_POSTGRESQL_VERSION=9.4.1208

RUN echo "export JAVA_OPTS=\"-Dsun.nio.cs.map=x-windows-iso2022jp/ISO-2022-JP -Djava.util.Arrays.useLegacyMergeSort=true -Djava.net.preferIPv4Stack=true\"" > /usr/local/tomcat/bin/setenv.sh && \
    rm -rf /usr/local/tomcat/webapps/* && \
    curl -jksSL -o /tmp/mysql-connector-java.tar.gz http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${JDBC_MYSQL_VERSION}.tar.gz && \
    tar -C /tmp -xvzf /tmp/mysql-connector-java.tar.gz && \
    cp /tmp/mysql-connector-java-${JDBC_MYSQL_VERSION}/mysql-connector-java-${JDBC_MYSQL_VERSION}-bin.jar /usr/local/tomcat/lib/ && \
    curl -jksSL -o /usr/local/tomcat/lib/postgresql-${JDBC_POSTGRESQL_VERSION}.jar http://jdbc.postgresql.org/download/postgresql-${JDBC_POSTGRESQL_VERSION}.jar && \
    rm -rf /tmp/* && \
    mkdir /usr/local/tomcat/datasource

COPY ./aipo.war /usr/local/tomcat/webapps/ROOT.war
COPY ./dbcp-org001.properties /usr/local/tomcat/datasource

CMD ["catalina.sh", "run"]