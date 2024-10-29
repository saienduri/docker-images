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

RUN groupadd -g 109 render
RUN groupadd -g 44 video

RUN sudo apt update -y \
    && sudo apt install -y "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)" \
    && sudo usermod -a -G render,video runner \
    && wget https://repo.radeon.com/amdgpu-install/6.2.2/ubuntu/jammy/amdgpu-install_6.2.60202-1_all.deb \
    && sudo apt install -y ./amdgpu-install_6.2.60202-1_all.deb \
    && sudo apt update -y \
    && sudo apt install -y rocm
