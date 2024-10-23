#!/usr/bin/env bash

set -euox pipefail

echo "Tweaking existing server config..."

if [[ ${SOURCE_IMAGE} =~ ucore ]]; then
    # moby-engine packages on uCore conflict with docker-ce
    rpm-ostree override remove \
        containerd moby-engine runc
    rm -f /usr/bin/docker-compose
    rm -fr /usr/libexec/docker
fi