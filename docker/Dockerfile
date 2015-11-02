FROM ubuntu:14.04

RUN sudo apt-get -y install wget
RUN wget http://archive.cloudera.com/cdh5/one-click-install/precise/amd64/cdh5-repository_1.0_all.deb
RUN sudo dpkg -i cdh5-repository_1.0_all.deb
RUN sudo apt-get update
RUN sudo apt-get -y install hive-server2 

RUN wget http://ftp.jaist.ac.jp/pub/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz && \
    tar xfz zookeeper-3.4.6.tar.gz && \
    cd zookeeper-3.4.6  && \
    cp zookeeper-3.4.6.jar /usr/lib/hive/lib/

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y mysql-server
RUN apt-get install libmysql-java && \
    cp /usr/share/java/mysql-connector-java.jar /usr/lib/hive/lib/

ADD create_database.sql /tmp/ 
RUN /etc/init.d/mysql start && \
    sleep 3 && \
    mysql -u root < /tmp/create_database.sql

ADD hive-site.xml /etc/hive/conf/
RUN mkdir -p /user/hive/warehouse/ && \
    chown -R hive /user/hive

RUN apt-get -y install python-setuptools
RUN easy_install supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 10000

CMD ["supervisord", "-n"]
