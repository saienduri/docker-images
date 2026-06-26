# Copyright Advanced Micro Devices, Inc.
# SPDX-License-Identifier: MIT

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      bash \
      ca-certificates \
      coreutils \
      dpkg-dev \
      fakeroot \
      file \
      findutils \
      gzip \
      python3 \
      python3-pip \
      rpm \
      tar \
      unzip \
      xz-utils \
    && rm -rf /var/lib/apt/lists/*
