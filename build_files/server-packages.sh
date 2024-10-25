#!/usr/bin/env bash

set -euox pipefail

echo "Running server packages scripts..."
/ctx/build_files/server-docker-ce.sh

# common packages installed to desktops and servers
rpm-ostree install \
  bc \
  erofs-utils \
  hdparm \
  iotop \
  ipcalc \
  iperf3 \
  just \
  lm_sensors \
  lshw \
  lzip \
  netcat \
  nmap \
  p7zip \
  p7zip-plugins \
  socat \
  unrar
