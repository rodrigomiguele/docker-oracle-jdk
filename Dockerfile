FROM alpine

ENV HOME /root

RUN mkdir /opt

COPY glibc-2.21-r2.apk $HOME

RUN apk add --update libgcc && \
    cd $HOME && \
    apk add --allow-untrusted glibc-2.21-r2.apk && \
    rm -f glibc-2.21-r2.apk && \
    apk info --purge

COPY jdk-6u45-linux-x64.bin /opt/

RUN cd /opt && \
    ./jdk-6u45-linux-x64.bin && \
    rm -f jdk-6u45-linux-x64.bin && \
    mv jdk* jdk

ENV JAVA_HOME /opt/jdk

ENV PATH $PATH:$JAVA_HOME/bin
