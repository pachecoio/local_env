#!/bin/bash

# Script used to start tmux automatically when openning the terminal zsh

if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

