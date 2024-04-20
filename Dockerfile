FROM docker.io/alpine:3.19

COPY entrypoint.sh /

COPY UpdateTracker.sh /etc/periodic/daily/

ENV DOWNLOAD_DIR=/root/Download
ENV RPC_LISTEN_PORT=6800
ENV RPC_SECRET=ARIA2
ENV BT_LISTEN_PORT=6900
ENV SHOW_CONSOLE_READOUT=true
ENV DISK_CACHE=64M
ENV FILE_ALLOCATION=none

RUN apk add --no-cache aria2=1.37.0-r0 curl=8.5.0-r0 && \
    curl -o https://github.com/P3TERX/aria2.conf/archive/refs/heads/master.zip && \
    unzip aria2.conf.zip /root/ && mv /root/aria2.conf-master /root/.aria2 && \
    touch /root/.aria2/aria2.session && \
    chmod +x /entrypoint.sh /etc/periodic/daily/UpdateTracker.sh

VOLUME /root/.aria2

EXPOSE 6800/tcp
EXPOSE 6900/tcp
EXPOSE 6900/udp

CMD ["/entrypoint.sh"]