#!/bin/bash

# Name of the text file containing the list of extensions to install
EXTENSIONS_FILE="./code-insiders.extensions.md"


# Check if code-insiders is installed
if ! command -v code-insiders &> /dev/null
then
    echo "VSCode Insiders not installed. `brew` installs it."
    # install code-insiders with brew
    brew install --cask visual-studio-code-insiders
fi

# Loop through each extension in the text file and install it
while read -r extension || [[ -n "$extension" ]]; do
    echo "Installing extension: $extension"
    code-insiders --install-extension "$extension"
done < "$EXTENSIONS_FILE"

echo "✅"
