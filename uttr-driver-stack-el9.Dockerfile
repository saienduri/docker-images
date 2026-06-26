# Copyright Advanced Micro Devices, Inc.
# SPDX-License-Identifier: MIT

FROM rockylinux:9

RUN dnf -y install \
      bash \
      ca-certificates \
      cpio \
      file \
      findutils \
      gzip \
      python3 \
      python3-pip \
      rpm \
      rpm-build \
      tar \
      unzip \
      xz \
    && dnf clean all \
    && rm -rf /var/cache/dnf
