#Download base image ubuntu 18.04 LTS
FROM ubuntu:18.04

#COPY sources.list /etc/apt/sources.list
COPY zoneinfo/PRC /usr/share/zoneinfo/PRC
ENV TZ=Asia/Shanghai
RUN mkdir /usr/share/zoneinfo/Asia \
  && ln -snf /usr/share/zoneinfo/PRC /usr/share/zoneinfo/$TZ \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y cmake \ 
		git \
		subversion \
		libboost-all-dev \
#		asciidoc \
#		doxygen \
	 	libsystemd-dev \
		graphviz \
		silversearcher-ag \
		vim \
		iproute2 \
	 	traceroute \
		curl \
		dnsutils \
		net-tools \
		inetutils-ping \
		wget \
		gdb  \
		netcat-openbsd \
		sudo \
		tcpdump  \
		apt-utils 

RUN DEBIAN_FRONTEND=noninteractive apt-get install wireshark -y &&  \
    apt-get install -y tshark

RUN apt-get install -y unzip && \
    apt-get install -y unrar  && \
    apt-get install -y openssh-server 

RUN apt-get install -y gawk  \
		       git  \
		       diffstat  \
		       unzip  \
		       texinfo  \
		       gcc-multilib \
		       build-essential \
		       chrpath \
		       socat \
		       libsdl1.2-dev \
		       cpio \
		       locales 

#### Due to Oracle new license policy , can't use the following way to install oracle-jdk anymore

#RUN echo "oracle-java11-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
#  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu bionic main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
#  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
#  apt-get update && \
#  apt-get install -y --no-install-recommends oracle-java8-installer oracle-java11-set-default && \
#  apt-get install -y maven

RUN apt-get install -y default-jdk \
		       maven

COPY bashmarks.sh /root/.bashmarks.sh


RUN echo "\n  \
export PS1='\[\e[31;7m\][\u@\h \w]\$ \[\e[m\]' \n \
source ~/.bashmarks.sh  \n " \
>> ~/.bashrc

RUN locale-gen en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

ARG USERNAME=genivi
ARG PASSWORD=genivi

RUN groupadd genivi
RUN useradd -d /home/$USERNAME -ms /bin/bash -g genivi -G sudo $USERNAME
COPY bashmarks.sh /home/$USERNAME/.bashmarks.sh

RUN echo "\n  \
export PS1='\[\e[31;7m\][\u@\h \w]\$ \[\e[m\]' \n \
source ~/.bashmarks.sh  \n " \
>> /home/$USERNAME/.bashrc

RUN chown -R $USERNAME: /home/$USERNAME
RUN echo "$USERNAME:$PASSWORD" | chpasswd
