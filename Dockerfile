FROM ubuntu:latest
MAINTAINER Wenxuan Zhao <viz@linux.com>

RUN set -x \
    && apt-get update \
    && apt-get install -y make tidy libxml2-utils docbook-utils xsltproc fop \
                          docbook-xsl ttf-wqy-microhei ttf-wqy-zenhei
