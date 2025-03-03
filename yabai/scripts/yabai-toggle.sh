#!/bin/bash

# Function to toggle a window between floating & snapped position
# Get the currently focused window
active_window=$(yabai -m query --windows | jq -r 'map(select(.focused==1)) | .[0].id // empty')

if [[ -n "$active_window" ]]; then
    # Get current display info
    current_display=$(yabai -m query --windows --window "$active_window" | jq -r '.display')
    display_width=$(yabai -m query --displays --display $current_display | jq -r '.frame.w')
    display_height=$(yabai -m query --displays --display $current_display | jq -r '.frame.h')
    
    # Check if we're on a large display (likely external monitor)
    is_large_display=0
    if [[ $display_width -gt 2000 ]]; then
        is_large_display=1
    fi
    
    # Check if the window is already floating
    is_floating=$(yabai -m query --windows --window "$active_window" | jq -r '.floating')

    if [[ "$is_floating" == "0" ]]; then
        # Make the window float
        yabai -m window "$active_window" --toggle float
        
        if [[ $is_large_display -eq 1 ]]; then
            # On large display - use right 1/3 layout
            right_width=$(( display_width / 3 ))
            yabai -m window "$active_window" --move abs:$((display_width - right_width)):0
            yabai -m window "$active_window" --resize abs:$right_width:$display_height
        else
            # On smaller display - center the window at 80% size
            window_width=$(( display_width * 80 / 100 ))
            window_height=$(( display_height * 80 / 100 ))
            x_pos=$(( (display_width - window_width) / 2 ))
            y_pos=$(( (display_height - window_height) / 2 ))
            yabai -m window "$active_window" --move abs:$x_pos:$y_pos
            yabai -m window "$active_window" --resize abs:$window_width:$window_height
        fi
    else
        # Make the window managed again (return it to the stack)
        yabai -m window "$active_window" --toggle float
        
        if [[ $is_large_display -eq 1 ]]; then
            # On large display - use 2/3 grid
            yabai -m window "$active_window" --grid 1:3:0:0:2:1
        else
            # On smaller display - use full width
            yabai -m window "$active_window" --grid 1:1:0:0:1:1
        fi
    fi
fi
