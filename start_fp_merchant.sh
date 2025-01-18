#!/bin/bash

SESSION_NAME="formpiper_merchant"

# Check if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null
if [ $? != 0 ]; then
  # Create a new session
  tmux new-session -d -s $SESSION_NAME -c ~/fp/formpiper-client -n editor

  # Open the text editor in the first window
  tmux send-keys -t $SESSION_NAME:editor 'nvim .' C-m

  # Create a new window for terminal
  tmux new-window -t $SESSION_NAME -n terminal -c ~/fp/formpiper-client

  # Create a new window for Server 1
  tmux new-window -t $SESSION_NAME -n server1 -c ~/fp/formpiper-client
  tmux send-keys -t $SESSION_NAME:server1 'yarn start' C-m

  # Optional: Switch to the first window (text editor) on attach
  tmux select-window -t $SESSION_NAME:editor
fi

# Attach to the session
tmux attach-session -t $SESSION_NAME

