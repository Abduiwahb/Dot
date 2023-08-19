#!/bin/bash

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    # metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
    metadata="$(playerctl metadata title 2> /dev/null | head -c 40)"
fi

if [[ $player_status = "Playing" ]]; then
    echo "%{T7}%{F#c8d3f5}  $metadata %{F-}%{T-}"
elif [[ $player_status = "Paused" ]]; then
    echo "%{T7}%{F#999999}  $metadata %{F-}%{T-}"
else
    echo "%{F#999999}No Media %{F-}"
fi
