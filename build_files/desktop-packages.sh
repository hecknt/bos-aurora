#!/usr/bin/env bash

set -euox pipefail

echo "Running desktop packages scripts..."

# ublue staging repo needed for ghostty, etc
dnf5 -y copr enable ublue-os/staging

# common packages installed to desktops
dnf5 install -y \
  gh \
  kitty \
  picard \
  ibm-plex-fonts-all \
  libpcap-devel \
  libretls \
  ltrace \
  patch \
  pipx \
  rsms-inter-fonts \
  strace \
  udica \
  ydotool

dnf5 -y copr disable ublue-os/staging
