# Minimal Docker image for bedtools v2.30.0 using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install bedtools
RUN apk update && \
    apk add bash bzip2-dev g++ make python3 xz-dev zlib-dev && \
    cd /usr/bin && \
    ln -s python3 python && \
    cd / && \
    wget -qO- "https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools-2.30.0.tar.gz" | tar -zx && \
    cd bedtools2 && \
    make && \
    make install && \
    cd .. && \
    rm -rf bedtools2
