FROM sunsolve/someip-core:latest

COPY build-someip-tools.sh /root/vsomeip-build/
RUN update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64
RUN cd /root/vsomeip-build && sh ./build-someip-tools.sh


RUN echo "\n  \
PATH=$PATH:/usr/local/bin/commonapi-generator:/usr/local/bin/commonapi-someip-generator \n \
cd ~ " \
>> ~/.bashrc

