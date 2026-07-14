FROM node:20-bookworm AS builder

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends git

RUN git clone https://github.com/NetrisTV/ws-scrcpy.git .

FROM node:20-bookworm-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends adb && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /app .

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV DEVICE_HOST=emulator:5555

EXPOSE 8000

CMD ["/start.sh"]