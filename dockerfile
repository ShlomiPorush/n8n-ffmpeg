# Multi-stage build to add ffmpeg to n8n
ARG N8N_VERSION=latest

# Stage 1: Get ffmpeg from Alpine
FROM alpine:3.20 AS ffmpeg-builder
RUN apk add --no-cache ffmpeg python3

# Stage 2: Use n8n as base and copy ffmpeg
FROM n8nio/n8n:${N8N_VERSION}

USER root

# Copy ffmpeg binary and its dependencies from Alpine
COPY --from=ffmpeg-builder /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=ffmpeg-builder /usr/bin/ffprobe /usr/bin/ffprobe
COPY --from=ffmpeg-builder /usr/bin/python3 /usr/bin/python3

# Copy all required shared libraries for ffmpeg
COPY --from=ffmpeg-builder /usr/lib /usr/lib
COPY --from=ffmpeg-builder /lib /lib

# Switch back to node user for security
USER node

# Add labels for better documentation
LABEL maintainer="shlomi"
LABEL description="n8n with FFmpeg"
LABEL version="1.0"
