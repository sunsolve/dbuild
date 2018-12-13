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
		maven \
		libboost-all-dev \
#		asciidoc \
#		doxygen \
	 	libsystemd-dev \	
		graphviz \
		silversearcher-ag \
		vim \


