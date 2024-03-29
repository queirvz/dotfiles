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
#         GGGGGG   GGGG     QQQQQQQQ::::QQ 
#                                   Q:::::Q
#                                    QQQQQQ


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gq/.oh-my-zsh"

export GOPATH=$HOME/go
export PATH=/usr/local/go/bin:$PATH:$GOPATH/bin

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

VSCODE=code-insiders

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	python
	vscode
	zsh-syntax-highlighting
	zsh-autosuggestions
	colored-man-pages
	#charm
	pip
	#ssh-agent
	#tmux
	#vi-mode
	ubuntu
	)

source $ZSH/oh-my-zsh.sh

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# User configuration

## programming-related
alias svba='source venv/bin/activate'
alias brave='/mnt/c/Program\ Files/BraveSoftware/Brave-Browser-Beta/Application/brave.exe'
alias subl='/mnt/c/Program\ Files/SublimeText/sublime_text.exe'
alias code='/mnt/c/Users/GQ/AppData/Local/Programs/Microsoft\ VSCodeInsiders/bin/code-insiders'

command -v lsd > /dev/null && alias ls='lsd -a --group-dirs first' && \
	alias tree='lsd --tree'

command -v ll > /dev/null && alias ls='lsd -al --group-dirs first' && \
	alias tree='lsd --tree'

command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
	alias tree='colorls --tree'

#alias ls='ls -lha --color=auto'
alias loadful='cd $HOME/gq_lab/feausp-lab && source venv/bin/ && echo "entering feausp-lab repository" && ls'

alias loaddapt='cd $HOME/rwcm_lab/rw_dapt && source venv/bin/activate && echo "entering rw_data_processing_tool repository" && cd ./src && ls'

alias downloads='cd /mnt/c/Users/GQ/Downloads/misc/'
alias dox='cd /mnt/c/Users/GQ/Documents/'

alias jup='cd /home/$USER/gq_lab/notebooks && jupyter notebook --no-browser'

alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'

alias bat='batcat'

alias tmp='cd /tmp/ && echo "entering the directory for temporary files"'

alias lab="cd /home/$USER/gq_lab/ && echo entering the lab... && ls"

#export EDITOR='/usr/bin/subl'
#export VISUAL='/usr/bin/subl'

## WSL-specific

### after `sudo mount -t drvfs G: /mnt/g` on WSL
alias drive='cd /mnt/g/My\ Drive/gq_drive/'
alias opendrive=' explorer.exe G\:\\My\ Drive\\gq_drive'

### /home/$USER/bin/wsl-open
alias open='wsl-open'

### ms office & windows-related
#alias explorer='/mnt/c/Windows/explorer.exe'
alias files='/mnt/c/Users/GQ/AppData/Local/Microsoft/WindowsApps/files.exe'
alias expl='/mnt/c/WINDOWS/explorer.exe'
alias onedrive='/mnt/c/Program\ Files/Microsoft\ OneDrive/OneDrive.exe'
alias excel='/mnt/c/Program\ Files/Microsoft\ Office/root/Office16/EXCEL.EXE'
alias powerpoint='/mnt/c/Program\ Files/Microsoft\ Office/root/Office16/POWERPNT.EXE'
alias outlook='/mnt/c/Program\ Files/Microsoft\ Office/root/Office16/OUTLOOK.EXE'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###########################################

# [.sh scripts located in /home/$USER/bin/]

## from [wsl-open](https://github.com/4U6U57/wsl-open) (WSL xdg-open utility)
## after `curl -o ~/gq_lab/gq_dotfiles/bin/wsl-open https://raw.githubusercontent.com/4U6U57/wsl-open/master/wsl-open.sh`
[[ -e ~/bin ]] && export PATH=$PATH:~/bin

## from []() ()
##

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gq/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gq/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gq/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gq/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/home/gq/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
