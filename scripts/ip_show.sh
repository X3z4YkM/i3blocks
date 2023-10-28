#!/bin/bash
output=$(ip -4 a | grep -Eo 'inet ([0-9]*\.){3}[0-9]+' | grep -Ev '127\.0\.0\.1|172\.17\.0\.1' | awk '{print $2}')

if [ -z "$output" ]; then
  echo "[No signal]"
else
  echo "$output"
fi
