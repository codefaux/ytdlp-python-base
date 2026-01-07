FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1

# Install essential tools
RUN apt-get update && apt-get install -y curl ca-certificates xz-utils && rm -rf /var/lib/apt/lists/*

# Install ffmpeg static from johnvansickle.com
RUN curl -L -o ffmpeg-release.tar.xz https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
    tar -xvf ffmpeg-release.tar.xz && \
    cd ffmpeg-*-amd64-static && \
    mv ffmpeg ffprobe /usr/local/bin/ && \
    cd .. && \
    rm -rf ffmpeg-release.tar.xz ffmpeg-*-amd64-static

RUN pip install --no-cache-dir yt-dlp[default,curl-cffi] requests --prefer-binary
