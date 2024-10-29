FROM ghcr.io/actions/actions-runner:latest

RUN sudo apt-get update -y \
    && sudo apt-get install -y software-properties-common \
    && sudo add-apt-repository -y ppa:git-core/ppa \
    && sudo apt-get update -y \
    && sudo apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    jq \
    sudo \
    unzip \
    zip \
    cmake \
    ninja-build \
    clang \
    lld \
    && sudo rm -rf /var/lib/apt/lists/*

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && \
    sudo apt-get install git-lfs

# Register the ROCM package repository, and install rocm-dev package
ARG ROCM_VERSION=6.2
ARG AMDGPU_VERSION=6.2

RUN sudo apt-get update && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends ca-certificates curl libnuma-dev gnupg \
  && curl -sL https://repo.radeon.com/rocm/rocm.gpg.key | sudo apt-key add - \
  && printf "deb [arch=amd64] https://repo.radeon.com/rocm/apt/$ROCM_VERSION/ jammy main" | sudo tee /etc/apt/sources.list.d/rocm.list \
  && printf "deb [arch=amd64] https://repo.radeon.com/amdgpu/$AMDGPU_VERSION/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/amdgpu.list \
  && sudo apt-get update && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
  sudo \
  libelf1 \
  kmod \
  file \
  python3-dev \
  python3-pip \
  rocm-dev \
  rocm-libs \
  build-essential && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*

RUN  groupadd -g 109 render
