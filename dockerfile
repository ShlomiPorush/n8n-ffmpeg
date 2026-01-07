# Multi-stage build to restore apk-tools and install ffmpeg
ARG N8N_VERSION=latest
FROM n8nio/n8n:${N8N_VERSION} as base

# First stage: get apk-tools from Alpine
FROM alpine:3.20 as tools
RUN apk add --no-cache apk-tools

# Final stage: use n8n image and add apk-tools back
FROM base
USER root

# Copy apk-tools from the tools stage
COPY --from=tools /sbin/apk /sbin/apk
COPY --from=tools /lib/apk /lib/apk
COPY --from=tools /lib/libapk.so.* /lib/
COPY --from=tools /usr/lib/libz.so.* /usr/lib/

# Install ffmpeg and other dependencies
RUN apk update && \
    apk add --no-cache ffmpeg curl python3 && \
    rm -rf /var/cache/apk/*

# Switch back to node user for security
USER node

# Add labels for better documentation
LABEL maintainer="shlomi"
LABEL description="n8n with FFmpeg"
LABEL version="1.0"
