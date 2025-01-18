#!/bin/bash

SESSION_NAME="formpiper_api"

# Check if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null
if [ $? != 0 ]; then
  # Create a new session
  tmux new-session -d -s $SESSION_NAME -c ~/fp/formpiper-api -n editor

  # Open the text editor in the first window
  tmux send-keys -t $SESSION_NAME:editor 'nvim .' C-m

  # Create a new window for terminal
  tmux new-window -t $SESSION_NAME -n terminal -c ~/fp/formpiper-api
  
  # Create a new window for Server 1
  tmux new-window -t $SESSION_NAME -n server -c ~/fp/formpiper-api
  tmux send-keys -t $SESSION_NAME:server 'yarn start:server' C-m

  # Create a new window for Server 2
  tmux new-window -t $SESSION_NAME -n worker -c ~/fp/formpiper-api
  tmux send-keys -t $SESSION_NAME:worker 'yarn start:worker' C-m

  # Create a new window for Server 3
  tmux new-window -t $SESSION_NAME -n client -c ~/fp/formpiper-api
  tmux send-keys -t $SESSION_NAME:client 'yarn start:client' C-m

  # Optional: Switch to the first window (text editor) on attach
  tmux select-window -t $SESSION_NAME:editor
fi

# Attach to the session
tmux attach-session -t $SESSION_NAME

