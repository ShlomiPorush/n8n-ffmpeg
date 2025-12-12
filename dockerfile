FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Update package list and install dependencies
RUN apk update && \
    apk add --no-cache ffmpeg curl python3

RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
    -o /usr/local/bin/yt-dlp && \
    chmod +x /usr/local/bin/yt-dlp

# Switch back to node user for security
USER node

# Add labels for better documentation
LABEL maintainer="shlomi"
LABEL description="n8n with FFmpeg"
LABEL version="1.0"
