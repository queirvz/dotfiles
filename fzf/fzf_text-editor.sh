#! /bin/zsh

# This script combines `fzf`, `ripgrep`, and `code` to allow you to fuzzy search
# Inspired by [Andrew Quinn's "So you've installed `fzf`. Now what?"](https://andrew-quinn.me/fzf/)

# Fuzzy search every line in every file
code $(rg . | fzf)
# Fuzzy search every line, in every file, and return the file location
code $(rg . | fzf | cut -d ":" -f 1)
# Fuzzy search every line, in every file, and open that file
code $(rg . | fzf | cut -d ":" -f 1)
