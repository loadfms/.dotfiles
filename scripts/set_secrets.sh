#!/bin/bash

if [ -f ~/.config/secrets/gh_token ]; then
    GH_TOKEN=$(<~/.config/secrets/gh_token)
    export GITHUB_TOKEN="$GH_TOKEN"
fi

if [ -f ~/.config/secrets/open_ai_cp ]; then
    OPENAI_API_KEY=$(<~/.config/secrets/open_ai)
    export OPENAI_API_KEY="$OPENAI_API_KEY"
fi

export GOPRIVATE=github.com/AcordoCertoBR
