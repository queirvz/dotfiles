#!/bin/bash

# Name of the text file containing the list of extensions to install
EXTENSIONS_FILE="extensions.txt"

# Check if Visual Studio Code is installed
if ! command -v code-insiders &> /dev/null
then
    echo "Visual Studio Code is not installed. Aborting."
    exit 1
fi

# Loop through each extension in the text file and install it
while read -r extension || [[ -n "$extension" ]]; do
    echo "Installing extension: $extension"
    codium --install-extension "$extension"
done < "$EXTENSIONS_FILE"

echo "All extensions have been installed."

