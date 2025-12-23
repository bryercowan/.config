#!/usr/bin/env bash
# Slow planet rotation drift for MapSCII (macOS safe)

export TERM=xterm-256color

# Drift left forever, occasionally zoom in/out a little.
drift_left() {
  local seconds=$1
  for ((i = 0; i < $seconds; i++)); do
    printf "\033[D" # left arrow
    sleep 0.8       # drift speed (lower = faster)
  done
}

zoom_pulse() {
  local zooms=$((RANDOM % 3 + 2)) # 2–4 zoom steps
  if ((RANDOM % 2)); then
    for ((i = 0; i < zooms; i++)); do
      printf "+"
      sleep 0.4
    done
  else
    for ((i = 0; i < zooms; i++)); do
      printf "-"
      sleep 0.4
    done
  fi
}

{
  sleep 5 # give MapSCII time to load
  while true; do
    drift_left 20
    if ((RANDOM % 20 == 0)); then
      zoom_pulse
    fi
  done
} | expect -c 'spawn -noecho bash -c "TERM=xterm-256color mapscii"; interact'
