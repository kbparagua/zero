#!/bin/sh
# https://askubuntu.com/a/832453
tmux new-session -s "session0" -d
tmux split-window -h
tmux split-window -v
tmux -2 attach-session -d
