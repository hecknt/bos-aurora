#!/usr/bin/bash

set -eoux pipefail

if [[ "${IMAGE}" =~ cosmic|ucore ]]; then
    tee /usr/share/ublue-os/image-info.json <<'EOF'
{
  "image-name": "",
  "image-flavor": "",
  "image-vendor": "hecknt",
  "image-ref": "ostree-image-signed:docker://ghcr.io/hecknt/bos",
  "image-tag": "",
  "base-image-name": "",
  "fedora-version": ""
}
EOF
fi

case "${IMAGE}" in
"bluefin"*)
    base_image="silverblue"
    ;;
"bazzite"*|"aurora"*)
    base_image="kinoite"
    ;;
"cosmic"*)
    base_image="${BASE_IMAGE}"
    ;;
"ucore"*)
    base_image="${BASE_IMAGE}"
    ;;
esac

image_flavor="main"
if [[ "$IMAGE" =~ nvidia ]]; then
    image_flavor="nvidia"
fi

# Branding
cat <<<"$(jq ".\"image-name\" |= \"bos\" |
              .\"image-flavor\" |= \"${image_flavor}\" |
              .\"image-vendor\" |= \"hecknt\" |
              .\"image-ref\" |= \"ostree-image-signed:docker://ghcr.io/hecknt/bos\" |
              .\"image-tag\" |= \"${IMAGE}${BETA:-}\" |
              .\"base-image-name\" |= \"${base_image}\" |
              .\"fedora-version\" |= \"$(rpm -E %fedora)\"" \
    </usr/share/ublue-os/image-info.json)" \
>/tmp/image-info.json
cp /tmp/image-info.json /usr/share/ublue-os/image-info.json

if [[ "$IMAGE" =~ bazzite ]]; then
    sed -i 's/image-branch/image-tag/' /usr/libexec/bazzite-fetch-image
fi
