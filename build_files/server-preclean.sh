#!/usr/bin/env bash

set -euox pipefail

if [[ ${SOURCE_IMAGE} =~ ucore ]]; then
    echo "cleanup packages on uCore which conflict with common server packages"

    rpm-ostree override remove \
        containerd moby-engine runc
    rm -f /usr/bin/docker-compose
    rm -fr /usr/libexec/docker
fi