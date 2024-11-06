#!/usr/bin/env bash
set -e

tmux list-panes -a -F '#{session_name}:#{window_index}.#{pane_index}' | while read -r pane; do
    tmux send-keys -t "$pane" 'clear' C-m
    tmux clear-history -t "$pane"
done
