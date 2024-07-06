FROM debian:testing-slim

LABEL maintainer="Ricardo Bánffy <rbanffy@gmail.com>"

COPY dps8m-master /dps8m 

RUN DEBIAN_FRONTEND=noninteractive \
    apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends build-essential wget libuv1-dev && \
	cd /dps8m && \
	make && \
	make install && \
    apt purge -y build-essential wget libuv1-dev && \
    apt -y autoremove && \
    rm -rf /var/lib/apt/lists/*
