FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y curl ca-certificates xz-utils git && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY --from=mwader/static-ffmpeg:9.0.1 /ffmpeg /usr/local/bin/
COPY --from=mwader/static-ffmpeg:9.0.1 /ffprobe /usr/local/bin/

RUN uv pip install --no-cache-dir yt-dlp[default,curl-cffi] yt-dlp-ejs deno requests --system
