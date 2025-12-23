#!/bin/bash

SESSION_NAME="formpiper_api"

tmux has-session -t "$SESSION_NAME" 2>/dev/null
if [ $? != 0 ]; then
  # ── Window 1: editor ─────────────────────────────────────
  tmux new-session -d -s "$SESSION_NAME" -c ~/fp/formpiper-api -n editor

  # Capture the initial (left) pane id
  LEFT_PANE=$(tmux list-panes -t "$SESSION_NAME:editor" -F '#{pane_id}')

  # Split right column (30%), capture the new right pane id
  RIGHT_PANE=$(tmux split-window -h -p 30 -t "$LEFT_PANE" -P -F '#{pane_id}')

  # Split the RIGHT_PANE horizontally into top (existing RIGHT_PANE) + bottom (new)
  BOTTOM_RIGHT_PANE=$(tmux split-window -v -p 50 -t "$RIGHT_PANE" -P -F '#{pane_id}')
  TOP_RIGHT_PANE="$RIGHT_PANE" # original right pane becomes top-right after the split

  # Launch apps
  tmux send-keys -t "$LEFT_PANE" 'nvim .' C-m
  tmux send-keys -t "$TOP_RIGHT_PANE" 'btop' C-m
  tmux send-keys -t "$BOTTOM_RIGHT_PANE" 'cd ~/fp/formpiper-api && claude' C-m # ← change to your Claude command

  # ── Window 2: terminal ───────────────────────────────────
  tmux new-window -t "$SESSION_NAME" -n terminal -c ~/fp/formpiper-api

  # Left pane (shell)
  TERM_LEFT=$(tmux list-panes -t "$SESSION_NAME:terminal" -F '#{pane_id}')

  # Right column 30%
  TERM_RIGHT=$(tmux split-window -h -p 30 -t "$TERM_LEFT" -P -F '#{pane_id}')

  # Split right into top/bottom
  TERM_BOTTOM_RIGHT=$(tmux split-window -v -p 50 -t "$TERM_RIGHT" -P -F '#{pane_id}')
  TERM_TOP_RIGHT="$TERM_RIGHT"

  tmux send-keys -t "$TERM_TOP_RIGHT" 'btop' C-m
  tmux send-keys -t "$TERM_BOTTOM_RIGHT" 'TERM=xterm-256color ~/.config/mapscii_script.sh' C-m

  # ── Node servers (full pane) ─────────────────────────────
  tmux new-window -t "$SESSION_NAME" -n server -c ~/fp/formpiper-api
  tmux send-keys -t "$SESSION_NAME:server" 'yarn start:server' C-m

  tmux new-window -t "$SESSION_NAME" -n worker -c ~/fp/formpiper-api
  tmux send-keys -t "$SESSION_NAME:worker" 'yarn start:worker' C-m

  tmux new-window -t "$SESSION_NAME" -n client -c ~/fp/formpiper-api
  tmux send-keys -t "$SESSION_NAME:client" 'yarn start:client' C-m

  tmux select-window -t "$SESSION_NAME:editor"
fi

tmux attach-session -t "$SESSION_NAME"
