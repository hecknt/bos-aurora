#!/usr/bin/env bash

set -euox pipefail

echo "Running desktop packages scripts..."
/ctx/build_files/desktop-1password.sh

# common packages installed to desktops
rpm-ostree install \
  google-noto-sans-fonts \
  ibm-plex-fonts-all \
  gh \
  gnome-shell-extension-no-overview \
  google-noto-sans-fonts \
  libpcap-devel \
  libretls \
  ltrace \
  patch \
  pipx \
  rsms-inter-fonts \
  strace \
  udica \
  ydotool

# github direct installs
/ctx/build_files/github-release-install.sh twpayne/chezmoi x86_64
