#!/bin/sh

speedtest-cli --secure --no-upload --json | jq '.download' | xargs numfmt --to iec --format "  %8.2f"
