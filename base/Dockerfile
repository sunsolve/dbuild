#Download base image ubuntu 18.04 LTS
FROM ubuntu:18.04

#COPY sources.list /etc/apt/sources.list
COPY zoneinfo/PRC /usr/share/zoneinfo/PRC
ENV TZ=Asia/Shanghai
RUN mkdir /usr/share/zoneinfo/Asia \
  && ln -snf /usr/share/zoneinfo/PRC /usr/share/zoneinfo/$TZ \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone

RUN apt-get update && \
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
		tcpdump 

RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu bionic main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
  apt-get update && \
  apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default && \
  apt-get install -y maven

RUN  mkdir -p /root/vsomeip-build
RUN cd /root/vsomeip-build && \
    git clone https://github.com/GENIVI/capicxx-core-runtime.git && \
    git clone https://github.com/GENIVI/capicxx-core-tools.git && \
    git clone https://github.com/GENIVI/capicxx-someip-runtime.git && \
    git clone https://github.com/GENIVI/capicxx-someip-tools.git && \
    git clone https://github.com/GENIVI/vsomeip.git

COPY build-someip.sh /root/vsomeip-build/
COPY patch/*.patch /root/vsomeip-build/
RUN cd /root/vsomeip-build && sh ./build-someip.sh
