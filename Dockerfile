FROM ubuntu:12.04
MAINTAINER Manfred Touron m@42.am

RUN apt-get update
RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd
RUN echo "root:root" | chpasswd

# to install nodejs v0.8.26
RUN apt-get update; apt-get install build-essential git python libssl-dev wget vim curl psmisc -y
RUN cd /tmp; wget http://nodejs.org/dist/v0.8.26/node-v0.8.26.tar.gz; tar -zvxf node-v0.8.26.tar.gz; cd node-v0.8.26; ./configure; make; make install

#to copy node binaries into /opt/node
RUN mkdir -p /opt/node/; cd /opt/node; wget http://nodejs.org/dist/v0.10.22/node-v0.10.22-linux-x64.tar.gz; tar -zxvf node-v0.10.22-linux-x64.tar.gz; mkdir ./v0.10.22; cp -r node-v0.10.22-linux-x64/* ./v0.10.22; wget http://nodejs.org/dist/v0.8.26/node-v0.8.26-linux-x64.tar.gz; tar -zxvf node-v0.8.26-linux-x64.tar.gz; mkdir ./v0.8.26; cp -r node-v0.8.26-linux-x64/* ./v0.8.26



CMD ["/usr/sbin/sshd", "-D"]

EXPOSE 22
