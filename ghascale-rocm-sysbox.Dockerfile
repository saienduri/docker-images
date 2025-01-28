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
    wget \
    psmisc \
    python3.10-venv \
    && sudo rm -rf /var/lib/apt/lists/*

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && \
    sudo apt-get install git-lfs

RUN sudo groupadd -g 109 render

RUN sudo apt update -y \
    && sudo apt install -y "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)" \
    && sudo usermod -a -G render,video runner \
    && wget https://repo.radeon.com/amdgpu-install/6.2.2/ubuntu/jammy/amdgpu-install_6.2.60202-1_all.deb \
    && sudo apt install -y ./amdgpu-install_6.2.60202-1_all.deb \
    && sudo apt update -y \
    && sudo apt install -y rocm-dev

# Docker install
RUN sudo apt-get update && sudo apt-get install --no-install-recommends -y \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg-agent \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo apt-key fingerprint 0EBFCD88

RUN sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
RUN sudo apt-get update && sudo apt-get install --no-install-recommends -y docker-ce docker-ce-cli containerd.io
