FROM rocm/dev-ubuntu-22.04:6.3

RUN sudo apt-get update -y \
    pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.2
