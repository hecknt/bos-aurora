#!/bin/bash

set -ouex pipefail

case "${SOURCE_IMAGE}" in
"bluefin"*)
    /ctx/build_files/desktop-packages.sh
    ;;
"bazzite"*)
    /ctx/build_files/desktop-packages.sh
    ;;
"ucore"*)
    /ctx/build_files/server-preclean.sh
    ;;
esac

/ctx/build_files/server-packages.sh
