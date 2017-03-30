# Version: 0.0.1
FROM ubuntu:14.04   
MAINTAINER North Fun "fanbeishuang@126.com"
# CMD
VOLUME ["/root/sharedir"]
# ADD
COPY go1.8.linux-amd64.tar.gz /root/package/
WORKDIR /root/package
RUN apt-get update && \ 
	tar -xzvf go1.8.linux-amd64.tar.gz && \
	mv ./go /usr/local && \
	mkdir -p /root/workspace/go \
	/root/workspace/go/src \
	/root/workspace/go/pkg \
	/root/workspace/go/bin && \
	apt-get install -y git \
	vim && \
	apt-get clean  && \
	apt-get autoclean && \
	rm -rf /root/package /tmp/* /var/tmp/*

WORKDIR /root

ENV GOROOT=/usr/local/go
ENV GOPATH=/root/workspace/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

CMD ["bash"] 
