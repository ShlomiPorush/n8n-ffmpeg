ARG N8N_VERSION
FROM n8nio/n8n:${N8N_VERSION:-latest}-alpine

# Switch to root to have permissions for installation
USER root

# Install dependencies
# Using --no-cache is a Docker best practice to keep the image small
RUN apk add --no-cache ffmpeg curl python3

# Important: switch back to the original user defined in the official image
USER node

# Labels for your own tracking
LABEL maintainer="shlomip"
LABEL description="n8n extended with FFmpeg"
