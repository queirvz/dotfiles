#! /bin/zsh

# the `-v4` argument is used to indicate what runs behind the command, allowing one to read detailed verbose about a given operation passed to stow
# see `stow --help`

stow --target=${HOME} -v4 ${1}

