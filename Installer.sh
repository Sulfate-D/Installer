#!/bin/bash

echo "Work in progress"
discord_link="https://discord.gg/N8Hs4pyR"

# Check the operating system to determine the command to open the link
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open "$discord_link"  # For Linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
    open "$discord_link"  # For macOS
else
    echo "Unsupported operating system"
    exit 1
fi
