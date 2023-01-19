FROM jenkins/jenkins:latest
USER root
RUN  apt-get update && apt-get upgrade -y && \
     apt-get dist-upgrade -y  && \
     apt-get install python3-pip -y && \
     pip3 install ansible --upgrade && \
     apt install net-tools && \
     apt install iputils-ping -y && \
     apt install nano
#DOCKER

RUN  apt-get update && \
     apt-get install -y \
     ca-certificates \
     curl \
     gnupg \
     lsb-release
RUN  mkdir -p /etc/apt/keyrings && \
     curl -fsSL https://download.docker.com/linux/debian/gpg |  gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
     echo \
     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
     $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null && \
     apt-get update && \
     chmod a+r /etc/apt/keyrings/docker.gpg && \
     apt-get update

RUN  apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#DOCKER-COMPOSE

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 
RUN chmod +x /usr/local/bin/docker-compose

#NON-ROOT-PERMISSION

RUN apt-get install -y docker-ce-rootless-extras
RUN usermod -aG docker jenkins 

USER jenkins

EXPOSE 8099
