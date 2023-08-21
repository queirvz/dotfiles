#!/bin/zsh

# Run the code --list-extensions command and store the output in a variable
extensions=$(code-insiders --list-extensions)

# Extract the extension names from the output using grep and sort them alphabetically
names=$(echo "$extensions" | grep -o '[^@]*' | sort)

# Count the number of times each extension occurs using awk and sort the results by frequency
counts=$(echo "$extensions" | awk -F '@' '{print $1}' | sort | uniq -c | sort -rn)

# Print the extension names and their counts in a formatted table
printf "%-50s %s\n" "Extension" "Count"
printf "%-50s %s\n" "---------" "-----"
while read -r count name; do
  printf "%-50s %d\n" "$name" "$count"
done <<< "$counts"
