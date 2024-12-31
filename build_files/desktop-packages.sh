#!/usr/bin/env bash

set -euox pipefail

echo "Running desktop packages scripts..."

# ublue staging repo needed for ghostty, etc
dnf5 -y copr enable ublue-os/staging

# common packages installed to desktops
dnf5 install -y \
  gh \
  ghostty \
  kitty \
  picard \
  gnome-shell-extension-no-overview \
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

# github direct installs
/ctx/build_files/github-release-install.sh twpayne/chezmoi x86_64

# Zed because why not?
curl -Lo /tmp/zed.tar.gz \
    https://zed.dev/api/releases/stable/latest/zed-linux-x86_64.tar.gz
mkdir -p /usr/lib/zed.app/
tar -xvf /tmp/zed.tar.gz -C /usr/lib/zed.app/ --strip-components=1
ln -s /usr/lib/zed.app/bin/zed /usr/bin/zed
cp /usr/lib/zed.app/share/applications/zed.desktop /usr/share/applications/dev.zed.Zed.desktop
sed -i "s@Icon=zed@Icon=/usr/lib/zed.app/share/icons/hicolor/512x512/apps/zed.png@g" /usr/share/applications/dev.zed.Zed.desktop
sed -i "s@Exec=zed@Exec=/usr/lib/zed.app/libexec/zed-editor@g" /usr/share/applications/dev.zed.Zed.desktop
