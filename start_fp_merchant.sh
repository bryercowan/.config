#!/bin/bash

SESSION_NAME="formpiper_merchant"

# Check if the session already exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null
if [ $? != 0 ]; then
  # ── Window 1: editor ─────────────────────────────────────
  tmux new-session -d -s "$SESSION_NAME" -c ~/fp/formpiper-client -n editor

  LEFT_PANE=$(tmux list-panes -t "$SESSION_NAME:editor" -F '#{pane_id}')
  RIGHT_PANE=$(tmux split-window -h -p 30 -t "$LEFT_PANE" -P -F '#{pane_id}')
  BOTTOM_RIGHT_PANE=$(tmux split-window -v -p 50 -t "$RIGHT_PANE" -P -F '#{pane_id}')
  TOP_RIGHT_PANE="$RIGHT_PANE"

  tmux send-keys -t "$LEFT_PANE" 'nvim .' C-m
  tmux send-keys -t "$TOP_RIGHT_PANE" 'btop' C-m
  tmux send-keys -t "$BOTTOM_RIGHT_PANE" 'cd ~/fp/formpiper-client && claude' C-m # ← adjust if you have a specific Claude command

  # ── Window 2: terminal ───────────────────────────────────
  tmux new-window -t "$SESSION_NAME" -n terminal -c ~/fp/formpiper-client

  TERM_LEFT=$(tmux list-panes -t "$SESSION_NAME:terminal" -F '#{pane_id}')
  TERM_RIGHT=$(tmux split-window -h -p 30 -t "$TERM_LEFT" -P -F '#{pane_id}')
  TERM_BOTTOM_RIGHT=$(tmux split-window -v -p 50 -t "$TERM_RIGHT" -P -F '#{pane_id}')
  TERM_TOP_RIGHT="$TERM_RIGHT"

  tmux send-keys -t "$TERM_TOP_RIGHT" 'btop' C-m
  tmux send-keys -t "$TERM_BOTTOM_RIGHT" 'TERM=xterm-256color ~/.config/mapscii_script.sh' C-m

  # ── Window 3: server (full pane) ─────────────────────────
  tmux new-window -t "$SESSION_NAME" -n server1 -c ~/fp/formpiper-client
  tmux send-keys -t "$SESSION_NAME:server1" 'yarn start' C-m

  tmux select-window -t "$SESSION_NAME:editor"
fi

# Attach
tmux attach-session -t "$SESSION_NAME"
