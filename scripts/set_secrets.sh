#!/bin/bash

if [ -f ~/.config/secrets/gh_token ]; then
    GH_TOKEN=$(<~/.config/secrets/gh_token)
    export GITHUB_TOKEN="$GH_TOKEN"
fi

export GOPRIVATE=github.com/AcordoCertoBR
