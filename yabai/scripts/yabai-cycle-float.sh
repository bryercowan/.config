#!/bin/bash

# Function to cycle a floating window through different positions
# Get the currently focused window
active_window=$(yabai -m query --windows | jq -r 'map(select(.focused==1)) | .[0].id // empty')

if [[ -n "$active_window" ]]; then
    # Check if the window is floating
    is_floating=$(yabai -m query --windows --window "$active_window" | jq -r '.floating')
    
    if [[ "$is_floating" == "1" ]]; then
        # Get current display info
        current_display=$(yabai -m query --windows --window "$active_window" | jq -r '.display')
        display_width=$(yabai -m query --displays --display $current_display | jq -r '.frame.w')
        display_height=$(yabai -m query --displays --display $current_display | jq -r '.frame.h')
        
        # Get current window position and size
        window_info=$(yabai -m query --windows --window "$active_window")
        window_x=$(echo "$window_info" | jq -r '.frame.x')
        window_y=$(echo "$window_info" | jq -r '.frame.y')
        window_width=$(echo "$window_info" | jq -r '.frame.w')
        window_height=$(echo "$window_info" | jq -r '.frame.h')
        
        # Check if we're on a large display (likely external monitor)
        is_large_display=0
        if [[ $display_width -gt 2000 ]]; then
            is_large_display=1
        fi
        
        # Determine current position
        position="unknown"
        
        # For large displays
        if [[ $is_large_display -eq 1 ]]; then
            right_third=$(( display_width * 2 / 3 ))
            if [[ $window_x -ge $right_third ]]; then
                position="right"
            fi
        fi
        
        # Cycle through positions
        if [[ $position == "right" || $position == "unknown" ]]; then
            # Move to center position (80% of screen)
            window_width=$(( display_width * 80 / 100 ))
            window_height=$(( display_height * 80 / 100 ))
            x_pos=$(( (display_width - window_width) / 2 ))
            y_pos=$(( (display_height - window_height) / 2 ))
            yabai -m window "$active_window" --move abs:$x_pos:$y_pos
            yabai -m window "$active_window" --resize abs:$window_width:$window_height
        else
            # Move to right position (1/3 of screen)
            if [[ $is_large_display -eq 1 ]]; then
                right_width=$(( display_width / 3 ))
                yabai -m window "$active_window" --move abs:$((display_width - right_width)):0
                yabai -m window "$active_window" --resize abs:$right_width:$display_height
            fi
        fi
    fi
fi
