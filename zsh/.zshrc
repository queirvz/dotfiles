#                                          GQ's zsh config
#         GGGGGGGGGGGGG     QQQQQQQQQ      https://github.com/queirvz
#      GGG::::::::::::G   QQ:::::::::QQ    
#    GG:::::::::::::::G QQ:::::::::::::QQ  
#   G:::::GGGGGGGG::::GQ:::::::QQQ:::::::Q 
#  G:::::G       GGGGGGQ::::::O   Q::::::Q 
# G:::::G              Q:::::O     Q:::::Q 
# G:::::G              Q:::::O     Q:::::Q 
# G:::::G    GGGGGGGGGGQ:::::O     Q:::::Q 
# G:::::G    G::::::::GQ:::::O     Q:::::Q 
# G:::::G    GGGGG::::GQ:::::O     Q:::::Q 
# G:::::G        G::::GQ:::::O  QQQQ:::::Q 
#  G:::::G       G::::GQ::::::O Q::::::::Q 
#   G:::::GGGGGGGG::::GQ:::::::QQ::::::::Q 
#    GG:::::::::::::::G QQ::::::::::::::Q  
#      GGG::::::GGG:::G   QQ:::::::::::Q   
#         GGGGGG   GGGG     QQQQQQQQ:::::QQ 
#                                   Q:::::Q
#                                    QQQQQQ

<!--
https://
en.wikipedia.org
/wiki
/{
    Control_theory
    Cybernetics 
    Data
    Information_theory
    Information-theoretic_security
    Robotics
    Physics
    Mechanics
    Mathematics
    Systems_theory
    Theory_of_Computation
}
-->

# Powerlevel10k instant prompt -- block_1
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/Users/$USER/.local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh" # path to oh-my-zsh installation
ZSH_THEME="powerlevel10k/powerlevel10k" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" )
# CASE_SENSITIVE="true"
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto # update automatically
# zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 30 # how often to auto-update (days)

# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"
OMPLETION_WAITING_DOTS="%F{green}...%f" # or "true",  zsh.multiline < 5.7.1 (see #5765)
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd" # `man strftime`

# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    osx
    git
    pip
    python
    brew
    vscode
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
HISTCONTROL=ignoreboth

export PATH="/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
# export PATH="$HOME/.miniconda/bin:$PATH"  # commented out by conda initialize

# https://superuser.com/questions/1621771/brew-command-not-found-after-installing-homebrew-on-an-arm-m1-mac
eval $(/opt/homebrew/bin/brew shellenv)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

command -v lsd > /dev/null && alias ls='lsd -lha --group-dirs first' && \
	alias tree='lsd --tree --ignore-glob "venv"'

command -v ll > /dev/null && alias ls='lsd -al --group-dirs first' && \
	alias tree='lsd --tree --ignore-glob "venv"'

command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
	alias tree='colorls --tree --ignore-glob "venv"'

## programming-related
### fuzzy finder
alias fzfo='open $(fzf)' # at `/opt/homebrew/bin/`
alias fzfc='code-insiders --reuse-window $(fzf)' 
alias fzfl='lvim $(/opt/homebrew/bin/fzf)' 
alias hrg='history 1 | rg $1' 
alias fcl="osascript -e 'tell application \"Finder\" to close every window'"

### ascii/
alias asc="cd $HOME/lab/ascendium && cat csh_ascii | head -n 15 | tail -n 10"
alias csh="cd $HOME/lab/csh && cat csh_ascii | head -n 15 | tail -n 10"

### sampler (control_theory)
alias sampler '/opt/homebrew/Cellar/sampler/1.1.0/bin/sampler --config && /opt/homebrew/Cellar/sampler/1.1.0/config.yml'

### OS heuristics
alias apps='cd /Applications/ && open .'
alias brave='open -a "Brave Browser.app"'
alias ca='conda activate'
alias cat='bat'
alias catg='cat --style grid'

alias cd.='cd ../' # Krylov subspaces
alias cd..='cd ../../'
alias cd...='cd ../../../'

alias ls='lsd -lha --color=auto'

alias code='/opt/homebrew/bin/code-insiders --reuse-window'

alias dotfiles='cd $HOME/lab/dotfiles && tree && ls'

alias downloads='cd $HOME/Downloads && tree && ls'

wysiati="echo 'What you see is all that is. 👁️‍🗨️👁️‍🗨️' '' && ranger"

alias drive='cd /Users/$USER/Library/CloudStorage/GoogleDrive-guilhermenqueiroz@usp.br/My\ Drive/gq_drive/mirror && wysiati'


alias hl='cd ~/lab/headline && cat assets/logo-wordmark.2.resized.txt | head -n 15 | tail -n 13'

alias hldrive='cd /Users/$USER/Library/CloudStorage/GoogleDrive-guilherme@headline.com/Shared\ drives && wysiati'

alias hlbr='cd ~/lab/headlinebrazil && cat ~/lab/headline/assets/logo-wordmark.2.resized.txt | head -n 15 | tail -n 13'

alias pkc='pkc -f "Visual Studio Code - Insiders"'
alias pks='pkill -f "Spotify"'

alias lab="cd /Users/$USER/lab/ && lsd -lha --group-dirs first && wysiati" 

alias loadful='cd $HOME/lab/feausp-lab && source venv/bin/activate && ls'

alias mixxx='/opt/homebrew/Caskroom/mixxx/2.3.3/Mixxx.app/Contents/MacOS/mixxx --developer'

alias obb='conda activate obb && openbb'
alias cdobb='cd /Users/gq/.miniconda/envs/obb/lib/python3.9/site-packages/openbb_terminal'
alias obb_update='/Users/$USER/.miniconda/envs/obb/bin/pip install --upgrade openbb'

alias brew_update='brew upgrade && brew cleanup && brew outdated --cask'

# This one is binded to more than one execution processes
alias richd='conda activate venv_01 && rich --pager --markdown --line-numbers'
alias richd_pager='conda activate venv_01 && rich --pager --emoji'
# --->
alias scsh='cd /Users/$USER/google_drive_usp/gq_drive/mirror/screenshots && richd_pager "entering the screenshots :camera: directory" && tree && open .'
alias scsh2='cd /Users/$USER/google_drive_usp/gq_drive/mirror/screenshots && richd_pager ":camera:" && tree && open .'

alias stem='cd $HOME/lab/stem && tree'

alias svba='source venv/bin/activate'

alias tmp='cd /tmp/'

alias vi='nvim'

# ---
# Created with GPT-3.5
# ---
alias negimg='function __negimg() { local name=$(basename $1); local ext="${name##*.}"; convert $1 -negate "${name%.${ext}}.negative.${ext}"; }; __negimg'

#alias negpdf='function __negpdf() { local input="$1"; local output="${input%.pdf}.inverted.pdf"; gs -o "$output" -sDEVICE=pdfwrite -c "{1 exch sub}{1 exch sub}{1 exch sub}{1 exch sub} setcolortransfer" -f "$input"; }; __negpdf'

function negpdf() {
    local input="$1"
    local output="${input:r}.inverted.pdf"
    gs -o "$output" -sDEVICE=pdfwrite -c "{1 exch sub}{1 exch sub}{1 exch sub}{1 exch sub} setcolortransfer" -f "$input"
}

# CerradoBaru functions for neovim_farmers

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


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source /Users/gq/dev/github_apps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"

