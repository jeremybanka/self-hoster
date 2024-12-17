#!/bin/zsh

SESSION_NAME="tempest-games"

# Check if the session already exists
if ! tmux has-session -t $SESSION_NAME 2>/dev/null; then
    # Create a new tmux session and start the application
    tmux new-session -d -s $SESSION_NAME 'your_application_command_here'
    echo "Started tmux session: $SESSION_NAME"
else
    echo "Tmux session $SESSION_NAME already exists."
fi
