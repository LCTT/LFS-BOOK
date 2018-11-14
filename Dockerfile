# Dockerfile for build LFS book.
#
# Note: ubuntu is chosen because Java is required for fop.

FROM ubuntu:latest
MAINTAINER Wenxuan Zhao <viz@linux.com>

RUN useradd -m -s /bin/bash -u 1000 -U build \
 && apt-get update \
 && apt-get install -y make tidy libxml2-utils docbook-utils xsltproc fop \
                       docbook-xsl ttf-wqy-microhei ttf-wqy-zenhei bzip2 \
 && rm -rf /var/lib/apt/lists/*

USER build
WORKDIR /home/build/repo

CMD ["make", "book", "nochunks", "pdf", "REV=systemd", "V=1"]
