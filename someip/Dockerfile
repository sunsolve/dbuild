FROM sunsolve/someip-tools:latest

ARG USERNAME=someip
ARG PASSWORD=someip

RUN rm -rf /root/.m2 && \
    rm -rf /root/vsomeip-build/capicxx-core-tools && \
    rm -rf /root/vsomeip-build/capicxx-someip-tools 

RUN rm -rf /root/vsomeip-build/*.sh && \
    rm -rf /root/vsomeip-build/*.patch && \
    rm -rf /root/vsomeip-build/capicxx-core-runtime && \
    rm -rf /root/vsomeip-build/capicxx-someip-runtime

RUN apt-get -y install boxes
RUN apt-get -y install cowsay

#RUN adduser --disabled-password --gecos '' $USERNAME
RUN groupadd someip
RUN useradd -d /home/$USERNAME -ms /bin/bash -g someip -G sudo $USERNAME

RUN cp  /root/.bashmarks.sh /home/$USERNAME
RUN mv /root/vsomeip-build/vsomeip /home/$USERNAME/

RUN echo "\n  \
PATH=$PATH:/usr/local/bin/commonapi-generator:/usr/local/bin/commonapi-someip-generator \n\
export PS1='\[\e[31;7m\][\u@\h \w]\$ \[\e[m\]' \n\
source /home/$USERNAME/.bashmarks.sh \n\
cd /home/$USERNAME/vsomeip && s vsomeip \n\
cd /home/$USERNAME/vsomeip/examples/hello_world && s hello \n\
cd /home/$USERNAME/vsomeip/examples && s example \n  \
clear \n\
echo ' SOME/IP Development Environment ' | boxes -d columns -ac -s 46x6 \n\
echo '~~~ Hope you guy know what are you doing here !' | /usr/games/cowsay -W 55 -e @@ -T ~~\n\
echo -e \n\
echo -e \n\
cd ~ " \
>> /home/$USERNAME/.bashrc

RUN mkdir -p /var/run/sshd

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN chown -R $USERNAME: /home/$USERNAME
RUN echo "$USERNAME:$PASSWORD" | chpasswd

EXPOSE 22
CMD  ["/usr/sbin/sshd", "-D"]
