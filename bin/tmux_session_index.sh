tmux list-sessions -F '#{line} #{?session_attached,attached,}' | awk '{ if ($2 == "attached") print $1;}'
