#!/bin/bash

docker build . -t taletelr-flux
docker run -it --gpus all -p 8501:8501 -v /data/llama_factory/hf_cache:/root/.cache/huggingface \
  --memory=24g \
  --memory-swap=24g \
  taletelr-flux
