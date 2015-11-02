FROM ubuntu:14.04

RUN sudo apt-get -y install wget
RUN wget http://archive.cloudera.com/cdh5/one-click-install/precise/amd64/cdh5-repository_1.0_all.deb
RUN sudo dpkg -i cdh5-repository_1.0_all.deb
RUN sudo apt-get update
RUN sudo apt-get -y install hive-server2 

EXPOSE 10000

CMD ["/bin/bash"]
