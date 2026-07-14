# Builder
FROM debian:bookworm-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates \
    build-essential \
    pkg-config \
    ffmpeg \
    libavformat-dev \
    libavcodec-dev \
    libavdevice-dev \
    libavutil-dev \
    libavfilter-dev \
    libswscale-dev \
    libswresample-dev \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

WORKDIR /StarRailCopilot

RUN git clone https://github.com/LmeSzinc/StarRailCopilot.git .

RUN uv python install 3.10

RUN uv venv --python 3.10

RUN uv pip install "cython<3" "setuptools<70" wheel

RUN uv pip install --no-build-isolation -r requirements-in.txt

# Runtime
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    android-sdk-platform-tools \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN rm -rf /root/.cache/uv

WORKDIR /StarRailCopilot

COPY --from=builder /root/.local/share/uv/python /root/.local/share/uv/python
COPY --from=builder /StarRailCopilot /StarRailCopilot

CMD [".venv/bin/python", "gui.py"]