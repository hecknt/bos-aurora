# bOS-aurora

[![bOS Build Desktop](https://github.com/hecknt/bos-aurora/actions/workflows/build-desktop.yml/badge.svg)](https://github.com/hecknt/bos-aurora/actions/workflows/build-desktop.yml)
[![bOS Build Server](https://github.com/hecknt/bos-aurora/actions/workflows/build-server.yml/badge.svg)](https://github.com/hceknt/bos-aurora/actions/workflows/build-server.yml)

These are my personal Universal Blue image builds, customized with a few extras for myself.

## Under the Hood

There's a single image name `bos` with multiple tags.


### Desktops

Desktop/laptop images are built upon [Aurora](https://github.com/ublue-os/aurora).

- `bos:aurora` - an Aurora stable-daily image with ZFS support
- `bos:aurora-nvidia` - an Aurora stable-daily image with ZFS and Nvidia support
- `bos:aurora-dx` - an Aurora stable-daily image with ZFS support and extra developer features
- `bos:aurora-dx-nvidia` - an Aurora stable-daily image with ZFS and Nvidia support and extra developer features

### Servers

Server images are not being built yet. But when they are built, they will be built upon [uCore](https://github.com/ublue-os/ucore).

- `bos:ucore` - a uCore stable image with ZFS support
- `bos:ucore-nvidia` - a uCore stable image with ZFS and Nvidia support
- `bos:ucore-hci` - a uCore HCI stable image with ZFS support (adds hypervisor to uCore)
- `bos:ucore-hci-nvidia` - a uCore HCI stable image with ZFS and Nvidia support (adds hypervisor to uCore)
- `bos:ucore-minimal` - a uCore minimal stable image (*without* ZFS or Nvidia support)

## How to Install

Use the installation method for the respective upstream, Aurora, uCore, etc.

Then switch to **bOS** with a command like:

```
sudo bootc switch --enforce-container-sigpolicy ghcr.io/hecknt/bos:TAG
```

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/cosign/overview/) using. You can verify the signature by running the following command:

```
cosign verify --key cosign.pub ghcr.io/hecknt/bos:TAG
```

## DIY

This repo is built off of bhserman's [bOS](https://github.com/bhserman/bos), which itself was built off the [Universal Blue Image Template](https://github.com/ublue-os/image-template), although it has been added to significantly.

That template can be used to extend any image you like, Aurora, Bazzite, Bluefin, uCore or even **bOS** so you can make your own ***bOS***!

Also, if you just want to tinker, the images built here can be built locally using [`just`](https://just.systems/) and the provided `Justfile`.

```
# example
just build aurora
```
