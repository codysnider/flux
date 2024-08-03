FROM python:3.10-slim

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN pip install -e '.[all]'

EXPOSE 8501

ENV CUDA_VISIBLE_DEVICES=0

# Define environment variables for model paths (update these paths as needed)
# ENV FLUX_SCHNELL=<path_to_flux_schnell_sft_file>
# ENV FLUX_DEV=<path_to_flux_dev_sft_file>
# ENV AE=<path_to_ae_sft_file>

CMD ["CUDA_VISIBLE_DEVICES=0", "python", "-m", "flux", "--name", "flux-schnell", "--height", "1024", "--width","1024","--prompt", "a mouse on the moon", "--device", "cuda"]
