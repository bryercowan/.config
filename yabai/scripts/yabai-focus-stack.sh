#!/bin/bash

# Function to focus the first window in the stack
# Get all windows in the current space
windows=$(yabai -m query --windows --space)

# Get the first window in the stack (non-floating window)
first_stack_window=$(echo "$windows" | jq -r 'map(select(.floating==0)) | .[0].id // empty')

if [[ -n "$first_stack_window" ]]; then
    yabai -m window --focus "$first_stack_window"
fi
