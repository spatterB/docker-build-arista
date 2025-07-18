# Use Ubuntu as the base image
FROM ubuntu:22.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install Python 3 and pip (no Ansible via apt)
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        build-essential \
        libffi-dev \
        libssl-dev \
        ssh \
        git \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set Python3 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Default command
CMD [ "bash" ]
