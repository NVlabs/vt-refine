# Copyright (c) 2024-2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
#
# Licensed under the NVIDIA License [see LICENSE for details].

FROM nvidia/cuda:12.4.1-devel-ubuntu20.04

# Set the working directory to /root.
WORKDIR /root

# Install Python 3 and pip.
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Install Isaac Gym from TacSL.
# * https://github.com/isaac-sim/IsaacGymEnvs/blob/tacsl/isaacgymenvs/tacsl_sensors/install/tacsl_setup.md
RUN apt-get update && \
    apt-get install -y \
        libegl1 \
        libx11-dev \
        libx11-xcb1 \
        libxcb-dri3-0 \
        libxcb-glx0 \
        libxcb-present0 \
        libxcb-sync1 \
        libxext6 && \
    pip install gdown && \
    gdown 1nhLF4cKeUokCqU5LvEu8uYdEQtyJolXl && \
    tar zxvf IsaacGym_Preview_TacSL_Package.tar.gz && \
    pip install -e ./IsaacGym_Preview_TacSL_Package/isaacgym/python && \
    rm -rf /var/lib/apt/lists/*

# Set NVIDIA_DRIVER_CAPABILITIES for Isaac Gym viewer.
ENV NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility

# Install cuRobo.
# - pip>=21.3 is required for editable installs with pyproject.toml to go to /usr/local/lib/python3.8/dist-packages/ rather than /usr/lib/python3.8/site-packages/.
RUN apt-get update && \
    apt-get install -y \
        git \
        git-lfs && \
    git clone https://github.com/NVlabs/curobo.git && \
    pip install -U pip && \
    TORCH_CUDA_ARCH_LIST="7.0 7.2 7.5 8.0 8.6 8.7 8.9 9.0" python3 -m pip install -e ./curobo[dev] && \
    rm -rf /var/lib/apt/lists/*

# Install vt-refine.
# - pip>=21.3 is required for editable installs with pyproject.toml to go to /usr/local/lib/python3.8/dist-packages/ rather than /usr/lib/python3.8/site-packages/.
# - pip>=21.3 is required for editable installs with pyproject.toml without setup.py.
RUN apt-get update && \
    apt-get install -y \
        git \
        git-lfs && \
    git clone --recursive https://github.com/NVlabs/vt-refine.git && \
    pip install gdown && \
    pip install -U pip && \
    python3 -m pip install -e ./vt-refine/easysim[dev] && \
    python3 -m pip install -e ./vt-refine/easysim-envs[dev] && \
    python3 -m pip install -e ./vt-refine/dppo && \
    rm -rf /var/lib/apt/lists/*
