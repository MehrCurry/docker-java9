FROM ubuntu:14.04

RUN apt-get update -qq && apt-get install -qqy curl apt-transport-https software-properties-common python-software-properties
RUN apt-get update -qq && apt-get install -qqy iptables ca-certificates lxc git-core zip graphviz python
RUN curl -sSL https://get.docker.com/ | sh

RUN echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN add-apt-repository -y ppa:webupd8team/java && \
    apt-get update; \
    apt-get install -y oracle-java9-installer; \
    apt-get install -y oracle-java9-set-default; \
    rm -rf /var/cache/oracle-jdk9-installer
