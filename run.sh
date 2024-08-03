#!/bin/bash

docker build . -t taletelr-flux
docker run -it --gpus all -p 8501:8501 -e CUDA_VISIBLE_DEVICES=0 -v /data/llama_factory/hf_cache:/root/.cache/huggingface \
  --memory=12g \
  --memory-swap=12g \
  taletelr-flux
