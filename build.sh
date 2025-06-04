#!/bin/bash

set -ouex pipefail

case "${IMAGE}" in
"aurora"*)
    /ctx/build_files/desktop-changes.sh
    /ctx/build_files/desktop-steam.sh
    /ctx/build_files/desktop-packages.sh
    ;;
"bluefin"*)
    /ctx/build_files/desktop-changes.sh
    /ctx/build_files/desktop-steam.sh
    /ctx/build_files/desktop-packages.sh
    ;;
"bazzite"*)
    /ctx/build_files/desktop-changes.sh
    /ctx/build_files/desktop-packages.sh
    ;;
"ucore"*)
    /ctx/build_files/server-changes.sh
    /ctx/build_files/server-cockpit-zfs.sh
    ;;
esac

/ctx/build_files/server-packages.sh
/ctx/build_files/branding.sh
/ctx/build_files/signing.sh
