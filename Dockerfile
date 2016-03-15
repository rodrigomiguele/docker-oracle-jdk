FROM frolvlad/alpine-glibc

ENV JDK_URL 'http://download.oracle.com/otn-pub/java/jdk/8u73-b02/jdk-8u73-linux-x64.tar.gz'

RUN apk add --update curl && \
    mkdir /opt && \
    cd /opt && \
    curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k $JDK_URL && \
    tar -xzf jdk-*.tar.gz && rm -f jdk-*.tar.gz && \
    mv jdk* jdk && \
    apk del --purge curl

ENV JAVA_HOME /opt/jdk

ENV PATH $PATH:$JAVA_HOME/bin
