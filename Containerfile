ARG BASE_IMAGE="aurora"
ARG IMAGE="aurora"
ARG TAG_VERSION="stable"

FROM scratch AS ctx
COPY / /

FROM ghcr.io/ublue-os/${BASE_IMAGE}:${TAG_VERSION}

ARG BASE_IMAGE="aurora"
ARG IMAGE="aurora"

RUN --mount=type=bind,from=ctx,src=/,dst=/ctx \
    mkdir -p /var/lib/alternatives && \
    /ctx/build.sh && \
    mv /var/lib/alternatives /staged-alternatives && \
    ostree container commit && \
    mkdir -p /var/lib && mv /staged-alternatives /var/lib/alternatives && \
    mkdir -p /var/tmp && \
    chmod -R 1777 /var/tmp
