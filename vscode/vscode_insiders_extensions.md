# List of `VSCode` extensions

## Option 1

```zsh

#!/usr/bin/zsh

code-insiders --list-extensions >> vscode_insiders_e
xtensions.md

```zsh
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

```

## Option 2

```nvim
read! code-insiders --list-extensions 
```

outputs

```
- antfu.slidev
- asvetliakov.vscode-neovim
- bierner.markdown-mermaid
- DanielSanMedium.dscodegpt
- DavidAnson.vscode-markdownlint
- dendron.dendron
- dendron.dendron-markdown-shortcuts
- dendron.dendron-paste-image
- donjayamanne.python-environment-manager
- eamodio.gitlens
- esbenp.prettier-vscode
- foam.foam-vscode
- GitHub.copilot-labs
- GitHub.copilot-nightly
- GitHub.vscode-pull-request-github
- ivangabriele.vscode-git-add-and-commit
- marp-team.marp-vscode
- mdickin.markdown-shortcuts
- monokai.theme-monokai-pro-vscode
- ms-python.isort
- ms-python.python
- ms-python.vscode-pylance
- ms-toolsai.jupyter
- ms-toolsai.jupyter-keymap
- ms-toolsai.jupyter-renderers
- ms-toolsai.vscode-jupyter-cell-tags
- ms-toolsai.vscode-jupyter-slideshow
- njpwerner.autodocstring
- pnp.polacode
- redhat.vscode-yaml
- RomanPeshkov.vscode-text-tables
- shd101wyy.markdown-preview-enhanced
- tomoki1207.pdf
- vintharas.learn-vim
- vscode-icons-team.vscode-icons
- waderyan.gitblame
- yzhang.markdown-all-in-one
```
