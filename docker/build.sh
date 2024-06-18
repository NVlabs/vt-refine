#!/bin/bash

docker build \
  -f $( dirname ${BASH_SOURCE[0]} )/Dockerfile \
  --network host \
  --no-cache \
  -t vt-refine \
  .
