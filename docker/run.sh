#!/bin/bash

VT_REFINE_DIR=$( cd $( dirname ${BASH_SOURCE[0]} )/.. && pwd )

xhost +local:root
docker run \
  -it \
  -e DISPLAY \
  -e DPPO_DATA_DIR=/root/vt-refine/data \
  -e DPPO_LOG_DIR=/root/vt-refine/log \
  -e DPPO_WANDB_ENTITY \
  --gpus all \
  --net host \
  --privileged \
  --runtime nvidia \
  -v $VT_REFINE_DIR:/root/vt-refine \
  -v $HOME/.netrc:/root/.netrc \
  -w /root/vt-refine \
  vt-refine \
  /bin/bash
xhost -local:root
