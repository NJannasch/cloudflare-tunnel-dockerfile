FROM ubuntu:20.04

RUN apt update
RUN apt install curl wget python3 -y
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -P /tmp
RUN apt install ./tmp/cloudflared-linux-amd64.deb

WORKDIR /app
ADD start.sh /app
ADD index.html /app
ENTRYPOINT ["/bin/bash", "/app/start.sh"]
