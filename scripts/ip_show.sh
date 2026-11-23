#!/bin/bash
# Skip loopback, docker and VPN interfaces by name instead of hardcoding addresses
output=$(ip -4 -o a | awk '$2 !~ /^(lo|docker|br-|veth|wg|tun)/ {split($4, a, "/"); print a[1]}')

if [ -z "$output" ]; then
  echo "[No signal]"
else
  echo "$output"
fi
