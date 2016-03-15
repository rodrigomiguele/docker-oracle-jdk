FROM frolvlad/alpine-glibc

COPY jdk-6u45-linux-x64.bin /opt/

RUN mkdir /opt && \
    cd /opt && \
    ./jdk-6u45-linux-x64.bin && \
    rm -f jdk-6u45-linux-x64.bin && \
    mv jdk* jdk

ENV JAVA_HOME /opt/jdk

ENV PATH $PATH:$JAVA_HOME/bin
