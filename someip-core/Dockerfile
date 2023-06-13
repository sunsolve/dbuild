FROM sunsolve/base:latest

RUN  mkdir -p /root/vsomeip-build
RUN cd /root/vsomeip-build && \
    git clone https://github.com/COVESA/capicxx-core-runtime.git && \
    git clone https://github.com/COVESA/capicxx-core-tools.git && \
    git clone https://github.com/COVESA/capicxx-someip-runtime.git && \
    git clone https://github.com/COVESA/capicxx-someip-tools.git && \
    git clone https://github.com/COVESA/vsomeip.git

COPY build-someip-core.sh /root/vsomeip-build/
RUN cd /root/vsomeip-build && sh ./build-someip-core.sh
