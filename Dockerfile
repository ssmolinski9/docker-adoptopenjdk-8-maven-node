FROM alpine:latest

MAINTAINER Sebastian Smolinski "sebastian.smolinski6@gmail.com"

ENV MAVEN_VERSION 3.6.3

#Install AdoptOpenJDK 8
#--------------------
RUN apk --no-cache add openjdk8 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add bash vim curl wget jq docker git tar unzip bash-completion ca-certificates

# Maven related
# -------------
RUN cd /opt && curl -sSl http://mirror.vorboss.net/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz | tar -xz

VOLUME /var/lib/maven

# Node related
# ------------
RUN echo "# Installing Nodejs"
RUN apk add --update nodejs npm
RUN npm set strict-ssl false && \
        npm install -g npm@latest && \
        npm install -g bower grunt grunt-cli && \
        npm cache clear -f && \
        npm install -g n && \
        n stable

ENV PATH "$PATH:/opt/apache-maven-3.6.3/bin"