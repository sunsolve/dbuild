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

RUN apt-get install -y unzip && \
    apt-get install -y unrar  && \
    apt-get install -y openssh-server 

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


RUN rm -rf /root/.m2 && \
    rm -rf /root/vsomeip-build/capicxx-core-tools && \
    rm -rf /root/vsomeip-build/capicxx-someip-tools 

#RUN cd /root/vsomeip-build && \
#    mkdir /usr/local/bin/commonapi-generator && \
#    unzip -d /usr/local/bin/commonapi-generator  ./capicxx-core-tools/org.genivi.commonapi.core.cli.product/target/products/commonapi-generator.zip && \
#    chmod +x /usr/local/bin/commonapi-generator/commonapi-generator-linux-x86_64 && \
#    mkdir -p /usr/local/bin/commonapi-someip-generator && \
#    unzip -d /usr/local/bin/commonapi-someip-generator ./capicxx-someip-tools/org.genivi.commonapi.someip.cli.product/target/products/commonapi_someip_generator.zip && \
#    chmod +x /usr/local/bin/commonapi-someip-generator/commonapi-someip-generator-linux-x86_64

RUN DEBIAN_FRONTEND=noninteractive apt-get install wireshark -y &&  \
    apt-get install -y tshark

COPY bashmarks.sh /root/.bashmarks.sh


RUN echo "\n  \
PATH=$PATH:/usr/local/bin/commonapi-generator:/usr/local/bin/commonapi-someip-generator \n \
export PS1='\[\e[31;7m\][\u@\h \w]\$ \[\e[m\]' \n \
source ~/.bashmarks.sh  \n \
cd /root/vsomeip-build/vsomeip && s vsomeip \n \
cd /root/vsomeip-build/vsomeip/examples/hello_world && s hello \n \
cd /root/vsomeip-build/vsomeip/examples && s example \n  \
cd ~ " \
>> ~/.bashrc
