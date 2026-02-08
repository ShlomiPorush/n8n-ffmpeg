# Use the official n8n image as the base
ARG N8N_VERSION
FROM n8nio/n8n:${N8N_VERSION:-latest}

# Switch to root to install system packages
USER root

# Install FFmpeg, Curl, and Python3 using apt-get
# Using --no-install-recommends to keep the image slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg curl python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the default n8n node user for security
USER node

# Metadata labels
LABEL maintainer="shlomip"
LABEL description="n8n with FFmpeg - Stable Debian Build"
