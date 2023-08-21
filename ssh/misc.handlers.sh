#! /bin/zsh
#
git clone --mirror <repository_url>
cd <repository_name>.git

git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch ssh' --prune-empty --tag-name-filter cat -- --all

git remote set-url origin git@github.com:queirvz/dotfiles.git

