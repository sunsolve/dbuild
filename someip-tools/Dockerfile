FROM sunsolve/someip-core:latest

COPY build-someip-tools.sh /root/vsomeip-build/
COPY patch/*.patch /root/vsomeip-build/
RUN cd /root/vsomeip-build && sh ./build-someip-tools.sh


RUN echo "\n  \
PATH=$PATH:/usr/local/bin/commonapi-generator:/usr/local/bin/commonapi-someip-generator \n \
cd ~ " \
>> ~/.bashrc

