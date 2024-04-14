#!/bin/sh

# Env to conf
sed -i "s,^\(dir=\).*,\1${DOWNLOAD_DIR:-/root/Download}," /root/.aria2/aria2.conf
sed -i "s,^\(rpc-listen-port=\).*,\1${RPC_LISTEN_PORT:-6800}," /root/.aria2/aria2.conf
sed -i "s,^\(rpc-secret=\).*,\1${RPC_SECRET:-ARIA2}," /root/.aria2/aria2.conf
sed -i "s,^\(listen-port=\).*,\1${BT_LISTEN_PORT:-6900}," /root/.aria2/aria2.conf
sed -i "s,^\(dht-listen-port=\).*,\1${BT_LISTEN_PORT:-6900}," /root/.aria2/aria2.conf
sed -i "s,^\(show-console-readout=\).*,\1${SHOW_CONSOLE_READOUT:-true}," /root/.aria2/aria2.conf
sed -i "s,^\(file-allocation=\).*,\1${FILE_ALLOCATION:-none}," /root/.aria2/aria2.conf
sed -i "s,^\(disk-cache=\).*,\1${DISK_CACHE:-64M}," /root/.aria2/aria2.conf

exec aria2c