FROM ubuntu:20.04

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update
RUN apt-get install -y texlive-xetex

ENTRYPOINT ["sh",  "/entrypoint.sh"]