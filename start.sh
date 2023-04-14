#!/usr/bin/env bash

wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -P /tmp
apt install ./tmp/cloudflared-linux-amd64.deb
python3 -m http.server 8000 &>/dev/null &

cloudflared tunnel --url http://localhost:8000/ |& tee -a index.html  # Could be filtered to just forward the URL or even create an automated redirect
