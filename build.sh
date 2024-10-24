#!/bin/bash

set -ouex pipefail

case "${IMAGE}" in
"bluefin"*)
    /ctx/build_files/desktop-changes.sh
    /ctx/build_files/desktop-packages.sh
    /ctx/build_files/steam.sh
    ;;
"bazzite"*)
    /ctx/build_files/desktop-changes.sh
    /ctx/build_files/desktop-packages.sh
    ;;
"ucore"*)
    /ctx/build_files/server-changes.sh
    ;;
esac

/ctx/build_files/server-packages.sh
/ctx/build_files/branding.sh
/ctx/build_files/signing.sh
