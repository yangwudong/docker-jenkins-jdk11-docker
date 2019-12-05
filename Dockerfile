FROM jenkins/jenkins:jdk11
MAINTAINER yangwudong@gmail.com
USER root

# Install the latest Docker CE binaries
RUN apt-get update
RUN apt-get -y install \
    	apt-transport-https \
	ca-certificates \
    	curl \
    	gnupg2 \
    	software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update
RUN apt-get -y install docker-ce docker-ce-cli containerd.io

RUN groupadd docker || exit 0
RUN usermod -aG docker jenkins || exit 0


USER jenkins