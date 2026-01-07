## 📦 n8n-ffmpeg: Extended N8N Container with Multimedia Capabilities

This Docker container is built on top of the official **n8n** image and extends its capabilities by adding essential multimedia processing tools. This allows your n8n automation workflows to efficiently handle video, audio, and complex file downloading tasks.

### 💡 What This Container Does

This image extends the `n8nio/n8n:latest` base by installing the following critical tools:

1.  **FFmpeg**: The leading open-source framework for handling, converting, and streaming multimedia data. This enables n8n workflows to perform tasks such as video format conversion, audio extraction, resizing, and cutting files.
2.  **yt-dlp**: A popular command-line program (a fork of `youtube-dl`) capable of downloading media from thousands of different websites, including YouTube, Vimeo, and many others, directly within an n8n workflow.
3.  **Python 3**: Included for compatibility and executing advanced scripting nodes within n8n.

### 🚀 Usage and Deployment

### 1\. Running the Container (Docker Run)

To quickly launch the container, use the following `docker run` command, setting the necessary n8n configurations:

```bash
docker run -it --rm \
    --name n8n-ffmpeg \
    -p 5678:5678 \
    -v n8n_data:/home/node/.n8n \
    ghcr.io/shlomiporush/n8n-ffmpeg/n8n-ffmpeg:latest
```

  * **`shlomip/n8n-ffmpeg:latest`**: Your designated image name.
  * **`-p 5678:5678`**: Exposes the standard n8n port.
  * **`-v n8n_data:/home/node/.n8n`**: Uses a Docker Volume (`n8n_data`) to persist your workflow data and settings.

### 2\. Using Docker Compose (Recommended)

Using Docker Compose simplifies deployment and management.

#### `docker-compose.yml`

```yaml
services:
  n8n:
    image: ghcr.io/shlomiporush/n8n-ffmpeg/n8n-ffmpeg:latest
    container_name: n8n-ffmpeg
    restart: always
    ports:
      - "5678:5678"
    environment:
      # Replace with your actual domain name or IP
      - N8N_HOST=localhost
      # Base URL used for webhooks
      - WEBHOOK_URL=http://localhost:5678/
      - N8N_PORT=5678
      - TZ=Asia/Jerusalem # Set your desired timezone
    volumes:
      # Mount persistent data for workflows and settings
      - n8n_data:/home/node/.n8n

volumes:
  n8n_data:
```
