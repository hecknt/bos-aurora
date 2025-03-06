#!/usr/bin/env bash

set -euox pipefail

echo "Running desktop packages scripts..."

# ublue staging repo needed for ghostty, etc
dnf5 -y copr enable ublue-os/staging

# common packages installed to desktops
dnf5 install -y \
  ccache \
  git \
  gh \
  kitty \
  picard \
  libpcap-devel \
  libretls \
  ltrace \
  patch \
  pipx \
  strace \
  udica \
  ydotool \
  btop \
  htop \
  # fonts
  rsms-inter-fonts \
  ibm-plex-fonts-all \
  jetbrains-mono-fonts-all \
  # virtual machine stuff - install virt-manager through flatpak
  libvirt \
  libvirt-daemon-kvm \
  libvirt-ssh-proxy \
  libvirt-nss \
  qemu-img \
  qemu-kvm \
  edk2-ovmf \
  guestfs-tools

dnf5 -y copr disable ublue-os/staging
