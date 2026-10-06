# Minimal Docker image for bedtools using Alpine base (3.20 because bedtools can't compile on newer versions of GCC)
FROM alpine:3.20

# install bedtools
RUN apk update && \
    apk add --no-cache bash bzip2-dev g++ make python3 xz-dev zlib-dev && \
    cd /usr/bin && \
    cd / && \
    wget -qO- "https://github.com/arq5x/bedtools2/releases/download/v2.31.1/bedtools-2.31.1.tar.gz" | tar -zx && \
    cd bedtools2 && \
    make && \
    make install && \
    cd .. && \
    rm -rf bedtools2
