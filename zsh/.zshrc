# Powerlevel10k instant prompt -- block_1
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/Users/$USER/.local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh" # path to oh-my-zsh installation
ZSH_THEME="powerlevel10k/powerlevel10k" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

CASE_SENSITIVE="false"

zstyle ':omz:update' mode auto # update automatically
# zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 60 # how often to auto-update (days)

# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"
OMPLETION_WAITING_DOTS="%F{green}...%f" # or "true",  zsh.multiline < 5.7.1 (see #5765)
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd" # `man strftime`

# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins: $ZSH/plugins/
# Custom plugins: $ZSH_CUSTOM/plugins/
plugins=(
    osx
    git
    pip
    python
    brew
    vscode-insiders
    marp
    charm
    vi-mode
    colorize
    colored-man-pages
    z
    zsh-completions
    zsh-vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-autopair)

# vi-mode
bindkey -v

# use vim keys in tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^?' backward-delete-char

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
export PATH="$HOME/.miniconda/bin:$PATH"  # commented out by conda initialize

# https://superuser.com/questions/1621771/brew-command-not-found-after-installing-homebrew-on-an-arm-m1-mac
eval $(/opt/homebrew/bin/brew shellenv)

# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

command -v lsd > /dev/null && alias ls='lsd -lha --group-dirs first' && \
	alias tree='lsd --tree --ignore-glob "venv"'

command -v ll > /dev/null && alias ls='lsd -al --group-dirs first' && \
	alias tree='lsd --tree --ignore-glob "venv"'

command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
	alias tree='colorls --tree --ignore-glob "venv"'

# programming-related
## fuzzy finder
alias fo='open $(fzf)' # at `/opt/homebrew/bin/`
alias fzc='code-insiders --reuse-window $(fzf)' 
alias fn='nvim $(fzf)'
# alias fk="kill -9 $(ps aux | fzf) #| awk '{print $2}')"
alias hrg='history 1 | rg $1' 
alias fcl="osascript -e 'tell application \"Finder\" to close every window'"
### ascii/
alias asc="cd $HOME/lab/ascendium && cat csh_ascii | head -n 15 | tail -n 10"

alias csh="cd $HOME/lab/csh && cat csh_ascii | head -n 15 | tail -n 10"
alias ind="cd $HOME/lab/csh && cat csh_ascii | head -n 21 | tail -n 3"
alias cshind="csh && ind"
alias cshi="cd $HOME/lab/csh && cat csh_ascii | head -n 15 | tail -n 10 && cat csh_ascii | head -n 21 | tail -n 3"

alias cybernetics="\cat ~/lab/csh/csh.asc_logo.txt"

alias jbt="cd $HOME/lab/apps.github/jabuti-ai && \cat jabuti_technologies.ascii"

### sampler (control_theory)
alias sampler '/opt/homebrew/Cellar/sampler/1.1.0/bin/sampler --config && /opt/homebrew/Cellar/sampler/1.1.0/config.yml'
### OS heuristics
alias apps='cd /Applications/ && open .'
alias brave='open -a "Brave Browser.app"'
alias ca='conda activate'
alias cat='bat'
alias catg='cat --style grid'

alias r='ranger'
alias cd.='cd ../' # Krylov subspaces
alias cd..='cd ../../'
alias cd...='cd ../../../'

alias ls='lsd -lha --color=auto'

alias code='/opt/homebrew/bin/code-insiders --reuse-window'

alias dotfiles='cd $HOME/lab/dotfiles && cat zsh/.zshrc | head -n 20 && ls' # | tail -n 20'

alias downloads='cd $HOME/Downloads && tree && ls'

alias drive='cd /Users/$USER/Library/CloudStorage/GoogleDrive-guilhermenqueiroz@usp.br/My\ Drive/gq_drive/mirror'
alias mail='ls /Users/$USER/Applications/Brave\ Browser\ Apps.localized/ | rg "mail" && sleep 1 && open /Users/$USER/Applications/Brave\ Browser\ Apps.localized/mail*'

alias hl='cd ~/lab/headline/ && \cat logo.headline.shorthand.ascii'
alias hlxp='cd ~/lab/headline/ && \cat logo.headline_xpinc.ascii'
alias hlrocket="cd $HOME/lab/headline && \cat logo.headline_xpinc.rocket.ascii.04"

alias hldrive='cd /Users/$USER/Library/CloudStorage/GoogleDrive-guilherme@headline.com/Shared\ drives && \cat ~/lab/headline/logo.headline.shorthand.ascii'
alias hlpipe='cd /Users/$USER/Library/CloudStorage/GoogleDrive-guilherme@headline.com/Shared\ drives/\[H\ BR\]\ Pipeline/2024/ && \cat ~/lab/headline/logo.headline.shorthand.ascii'
alias hlcal='gcalcli search Headline | rg "<>" && gcalcli search Headline | rg "GQ"'
alias hlapps='ls /Users/$USER/Applications/Brave\ Browser\ Apps.localized/ | rg "headline" && sleep 2 && open /Users/$USER/Applications/Brave\ Browser\ Apps.localized/headline*'
alias hlspd='sudo ~/lab/headline/from_pipe_to_drive.sh' # a .md file is required as posterior input, e.g., `spd file.md`
alias hlpipe23='/Users/gq/Library/CloudStorage/GoogleDrive-guilherme@headline.com/Shared\ drives/\[H\ BR\]\ Pipeline/2023'
alias pipe='\cat /Users/gq/lab/headline/logo.headline_xpinc.rocket.ascii.04 && sleep 2 && cd /Users/gq/Library/CloudStorage/GoogleDrive-guilherme@headline.com/Shared\ drives/\[H\ BR\]\ Pipeline/2024 && \ls'
alias hlwiki='wiki "headline_(company)"'

alias hlwb="hlrocket && sleep 2 && hlapps"

alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

alias pkc='pkc -f "Visual Studio Code - Insiders"'
alias pks='pkill -f "Spotify"'

alias lab="cd /Users/$USER/lab/ && lsd -lha --group-dirs first" 

alias loadful='cd $HOME/lab/feausp-lab && source venv/bin/activate && ls'
alias warp='echo -e "$(\cat $(</Applications/Warp.app/Contents/Resources/assets/onboarding/welcome_to_warp.txt))"'

alias mixxx='/opt/homebrew/Caskroom/mixxx/2.3.3/Mixxx.app/Contents/MacOS/mixxx --developer'
alias excel='/Applications/Microsoft\ Excel.app'
alias xl='open -a "Microsoft Excel"'
alias preview='open -a "Preview.app"'

alias obb='conda activate obb2 && python ~/lab/apps.github/OpenBBTerminal/terminal.py'

alias obbx='z /Users/gq/OpenBBUserData/exports && open $(fzf)'
alias cdobb='cd /Users/gq/.miniconda/envs/obb2/lib/python3.9/site-packages/openbb_terminal'
alias obb_update='/Users/$USER/.miniconda/envs/obb/bin/pip install --upgrade openbb'

alias brew_update='brew upgrade && brew cleanup && brew outdated --cask && \cat /Users/gq/lab/headline && \cat logo.headline_xpinc.rocket.ascii.04'

# This one is binded to more than one execution processes
alias richd='conda activate venv_01 && rich --pager --markdown --line-numbers'
alias richd_pager='conda activate venv_01 && rich --pager --emoji'
#alias scsh='cd /Users/$USER/google_drive_usp/gq_drive/mirror/screenshots && richd_pager "entering the screenshots :camera: directory" && tree && open .'
alias scsh='cd /Users/$USER/Library/CloudStorage/GoogleDrive-guilhermenqueiroz@usp.br/My\ Drive/gq_drive/mirror/screenshots && tree && ranger && open .'

alias drive='cd /Users/$USER/Library/CloudStorage/GoogleDrive-guilhermenqueiroz@usp.br/My\ Drive/gq_drive/mirror'
alias scsh2='cd /Users/$USER/google_drive_usp/gq_drive/mirror/screenshots && richd_pager ":camera:" && tree && open .'

alias stem='cd $HOME/lab/stem && tree'

alias svba='source venv/bin/activate'
alias lsvba='source ~/lab/lab_env/venv/bin/activate'

alias tmp='cd /tmp/'

alias vi='nvim'

alias std='reminders show todo'

# ---
# Created with GPT-3.5
# ---
# alias negimg='function __negimg() { local name=$(basename $1); local ext="${name##*.}"; convert $1 -negate "${name%.${ext}}.negative.${ext}"; }; __negimg'
# alias negimg='function __negimg() { local name=$(basename $1); local ext="${name##*.}"; convert $1 -negate "${name%.${ext}}.negative.${ext}"; }; __negimg'

# # Define a function called 'convert_to_negative'

# convert_to_negative() {
#   if [ $# -ne 1 ]; then
#     echo "Usage: convert_to_negative <input_image>"
#     return 1
#   fi

#   input_image="$1"
#   output_image="${input_image%.*}_negative.${input_image##*.}"
#  # Perform the image negation using ImageMagick's 'convert' command
#   convert "$input_image" -negate "$output_image"
#   echo "Image converted to negative and saved as '$output_image'"
# }
# #alias negpdf='function __negpdf() { local input="$1"; local output="${input%.pdf}.inverted.pdf"; gs -o "$output" -sDEVICE=pdfwrite -c "{1 exch sub}{1 exch sub}{1 exch sub}{1 exch sub} setcolortransfer" -f "$input"; }; __negpdf'

# function negpdf() {
#     local input="$1"
#     local output="${input:r}.inverted.pdf"
#     gs -o "$output" -sDEVICE=pdfwrite -c "{1 exch sub}{1 exch sub}{1 exch sub}{1 exch sub} setcolortransfer" -f "$input"
# }

# >>>>>>>>
# <<<<<<<<
#
#        _-_
#     /~~   ~~\
#  /~~         ~~\
# {               }
#  \  _-     -_  /
#    ~  \\ //  ~
# _- -   | | _- _
#   _ -  | |   -_
#       // \\
#
# >>>>>>>>
# <<<<<<<<

alias cb='load cerradobaru && source && tree . && open && ranger && drive'

# alias rm='trash'

export HISTFILESIZE=1000000
export HISTSIZE=1000000

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

source /Users/gq/github_apps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gq/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gq/.miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/gq/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gq/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# source /Users/gq/dev/github_apps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"

# export PATH=/opt/homebrew/bin/conda:$PATH

export PATH=/opt/homebrew/Caskroom/miniconda/base/envs/obb/etc/conda:$PATH

eval "$(zoxide init zsh)"

source /opt/homebrew/Caskroom/miniconda/base/envs/obb/etc/conda

# export PATH="/usr/local/anaconda3/bin:$PATH"
# [[ -e "/usr/local/anaconda3/etc/profile.d/conda.sh" ]] && source "/usr/local/anaconda3/etc/profile.d/conda.sh"

export PATH="/opt/homebrew/bin/conda:$PATH"
[[ -e "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]] && source "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"

export DYLD_LIBRARY_PATH="/usr/local/lib:$DYLD_LIBRARY_PATH"

export PATH="/Users/gq/.cargo/bin:$PATH"

source prefix/etc/profile.d/nix.sh

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# UNIX history, one of the most important commands for time travelling
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

