# Install ffmpeg with node runtime dependencies
ARG N8N_VERSION=latest
FROM n8nio/n8n:${N8N_VERSION}

USER root

# Install ffmpeg and other dependencies using apt (Debian-based)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        curl \
        python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to node user for security
USER node

# Add labels for better documentation
LABEL maintainer="shlomi"
LABEL description="n8n with FFmpeg"
LABEL version="1.0"
