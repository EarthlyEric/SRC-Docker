FROM python:3.10.10-slim

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    android-sdk-platform-tools \
    build-essential \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/LmeSzinc/StarRailCopilot.git /StarRailCopilot
WORKDIR /StarRailCopilot

RUN python3 -m venv venv && \
    ./venv/bin/pip install --no-cache-dir --upgrade pip && \
    ./venv/bin/pip install --no-cache-dir -r requirements.txt

CMD [ "./venv/bin/python", "gui.py" ]
