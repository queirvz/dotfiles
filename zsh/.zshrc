#                                          Guilherme Queiroz's zsh config
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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/Users/gq/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    osx
    git
    pip
    python
    brew
    vscode
    iterm2
    # tmux
    # charm
    vi-mode
    colorize
    colored-man-pages
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    
)

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

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/bin:$PATH"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
# export PATH="$HOME/.miniconda/bin:$PATH"  # commented out by conda initialize

# https://superuser.com/questions/1621771/brew-command-not-found-after-installing-homebrew-on-an-arm-m1-mac
eval $(/opt/homebrew/bin/brew shellenv)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

command -v lsd > /dev/null && alias ls='lsd -lha --group-dirs first' && \
	alias tree='lsd --tree'

command -v ll > /dev/null && alias ls='lsd -al --group-dirs first' && \
	alias tree='lsd --tree'

command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
	alias tree='colorls --tree'

## programming-related

alias apps='cd /Applications/ && open .'
alias brave='open -a "Brave Browser Beta.app"'
alias ca='conda activate'
alias cat='bat'

alias cd...='cd ../../../'
alias cd..='cd ../../'
alias cd.='cd ../'

alias code='/usr/local/bin/code-insiders'
alias dotfiles='cd $HOME/lab/dotfiles && echo "entering the dotfiles directory" && ls'
alias downloads='cd $HOME/Downloads && echo "entering the downloads directory" && tree'
alias dwdrive='cd /Users/gq/Library/CloudStorage/GoogleDrive-guilherme@drumwave.com/My\ Drive && echo "entering the Drumwave Google Drive directory" && ls && open .'
alias dwlab="dwdrive && cd /Users/$USER/lab/drumwave/ && lsd -lha --group-dirs first && echo entering the drumwave lab..."
alias gqdrive='cd /Users/gq/Library/CloudStorage/GoogleDrive-guilhermenqueiroz@usp.br/My\ Drive/gq_drive/mirror && echo "entering the USP Google Drive directory" && ls'
alias lab="cd /Users/$USER/lab/ && lsd -lha --group-dirs first && echo entering the lab..."
alias loadful='cd $HOME/lab/feausp-lab && source venv/bin/activate && echo "entering the feausp-lab environment" && ls'
alias ls='lsd -lha --color=auto'
alias mirror='cd /Users/$USER/google_drive_usp/gq_drive/mirror && echo "entering the USP Google Drive mirror directory" && tree'
alias mixxx='/opt/homebrew/Caskroom/mixxx/2.3.3/Mixxx.app/Contents/MacOS/mixxx --developer'
alias obb='conda activate obb && openbb'
alias richd='conda activate venv_01 && rich --pager --markdown --line-numbers'
alias scsh='cd /Users/$USER/google_drive_usp/gq_drive/mirror/screenshots && echo "entering the screenshots directory" && ls && open .'
alias stem='cd $HOME/lab/stem && echo "entering the stem directory" && tree'
alias svba='source venv/bin/activate'
alias tmp='cd /tmp/ && echo "entering the directory for temporary files"'
alias rm='trash'

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
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
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
