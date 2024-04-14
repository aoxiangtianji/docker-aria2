FROM docker.io/alpine:latest

COPY entrypoint.sh /

COPY UpdateTracker.sh /etc/periodic/daily/

ENV DOWNLOAD_DIR=/root/Download
ENV RPC_LISTEN_PORT=6800
ENV RPC_SECRET=ARIA2
ENV BT_LISTEN_PORT=6900
ENV SHOW_CONSOLE_READOUT=true
ENV DISK_CACHE=64M
ENV FILE_ALLOCATION=none

RUN apk -U upgrade && \
    apk add aria2 curl sed git && \
    git clone https://github.com/P3TERX/aria2.conf.git /root/.aria2 && \
    touch /root/.aria2/aria2.session && \
    chmod +x /entrypoint.sh /etc/periodic/daily/UpdateTracker.sh

VOLUME /root/.aria2

EXPOSE 6800/tcp
EXPOSE 6900/tcp
EXPOSE 6900/udp

CMD ["/entrypoint.sh"]