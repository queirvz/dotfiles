#!/bin/zsh

extensions=$(code-insiders --list-extensions | glow)

# Extract the extension names from the output using grep and sort them alphabetically
names=$(echo "$extensions" | grep -o '[^@]*' | sort)

echo "$names" > code-insiders.extensions.md

code-insiders code-insiders.extensions.md
