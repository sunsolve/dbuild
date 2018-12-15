#Download base image ubuntu 18.04 LTS
FROM centos

RUN yum update && \
    yum -y install iproute && \
    yum -y install traceroute  && \
    yum -y install telnet

RUN yum -y install bind-utils && \
    yum -y install tcpdump && \
    yum -y install net-tools

RUN yum -y install openssh-server && \
    yum -y install openssh-clients
