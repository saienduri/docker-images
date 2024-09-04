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
    && sudo rm -rf /var/lib/apt/lists/*

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    sudo apt-get install -y --no-install-recommends git-lfs
