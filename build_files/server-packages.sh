#!/usr/bin/env bash

set -euox pipefail

echo "Running server packages scripts..."
/ctx/build_files/server-docker-ce.sh

# common packages installed to desktops and servers
rpm-ostree install \
  bc \
  btop \
  hdparm \
  iotop \
  ipcalc \
  iperf3 \
  lm_sensors \
  lshw \
  lzip \
  netcat \
  nmap \
  p7zip \
  p7zip-plugins \
  unrar
