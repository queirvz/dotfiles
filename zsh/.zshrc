#                  @%                                                 
#                #*+=@                                                
#               ****+                                                 
#              #*##%*                                                 
#             %*%##+@                         @@@@                    
#           #*#********#%@@@@                +*######%%#*++*****++*@  
#   @+*+##%#**#*#*#**#**++******+*#         **#%******#####**#++*+#+#%
#  #+-+***##*#++%@@#*#****#*#***++*%      %***##*+*#*+++=+***=+++++*=#
#  #+@%*=+*+++==+++++**#***+*****+*@     #####*####%%%%%#*###++++*+-+#
#  #+-:+*+**++#+++*#******++            @###%%######%%##%%******+**%@ 
#  %=%%##*#***#****#**+***@             @#*####%%#*###***+*%   @@     
#    %#@  @%*+=+=+++=+#@                 #%%#*##++*#%#*#@             
#                                        ###*#@    %%%###             
#                                        @%%###    @#####             
#                                         %%###@   @####%             
#                                         @#####    #%%*%@            
#                                          %#%%#    %#####            
#                                          #%%#%@    ####%            
#                                          @#%###    %%####           
#                                           ##%##    @####%           
#                                           %*###%   #%%%#%           
#                                            %%###%@%%%##%            
#                                             ###*%%%%##@             
#                                               @%####%      2024.v_{10^1}         

# Powerlevel10k instant prompt -- block_1
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/Users/$USER/.local/bin:$PATH
export PATH=/Users/$USER/lab/lab_env/venv/lib/python3.11/site-packages:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh" # path to oh-my-zsh installation
# source ~/oh-my-zsh.sh

ZSH_THEME="powerlevel10k/powerlevel10k" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

CASE_SENSITIVE="false"

zstyle ':omz:update' mode auto # update automatically
zstyle ':omz:update' frequency 60 # how often to auto-update (days)

# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"
OMPLETION_WAITING_DOTS="%F{green}...%f" # or "true",  zsh.multiline < 5.7.1 (see #5765)
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd" # `man strftime`

# ZSH_CUSTOM=/path/to/new-custom-folder # `~/.config/` or xdg-compliant location

# Standard plugins: $ZSH/plugins/
# Custom plugins: $ZSH_CUSTOM/plugins/
plugins=(
    # zsh-syntax-highlighting
    brew
    charm
    colored-man-pages
    colorize
    git
    go
    marp
    osx
    pip
    python
    vi-mode
    vscode-insiders
    z
    zsh-autopair
    zsh-autosuggestions
    zsh-completions
    zsh-vi-mode
    )

# vi-mode
bindkey -v

# use vim keys in tab completion menu
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect '^?' backward-delete-char


# User configuration
export PATH="/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
export PATH="$HOME/.miniconda/bin:$PATH"  # commented out by conda initialize

# https://superuser.com/questions/1621771/brew-command-not-found-after-installing-homebrew-on-an-arm-m1-mac
eval $(/opt/homebrew/bin/brew shellenv)
eval "$(mcfly init zsh)"

# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

command -v lsd > /dev/null && alias ls='lsd -lha --color=always --group-dirs first' && \
	alias tree='lsd --tree --color=always --ignore-glob "venv"'

command -v ll > /dev/null && alias ls='lsd -al --color=always --group-dirs first'

command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
	alias tree='colorls --tree --ignore-glob "venv"'

# programming-related

## boilerplates to `~/.zshrc.local`
############################# 🔒 #############################
alias locals="\cat ~/.zshrc.local"

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
##############################################################

# alias fk="kill -9 $(ps aux | fzf) #| awk '{print $2}')"
alias hrg='history 1 | rg $1'
alias lst='lsd -lha --timesort --group-dirs last'
alias lstp='lsd -lha --timesort --group-dirs last | rg "infinite"'

## ascii
alias csh="cd $HOME/lab/csh && cat csh_ascii | head -n 15 | tail -n 10"
alias cshind="cd $HOME/lab/csh && cat csh_ascii | head -n 15 | tail -n 10 && cat csh_ascii | head -n 21 | tail -n 3"

alias cn="\cat ~/lab/csh/csh.asc_logo.txt"

### sampler (control_theory)
alias sampler='/opt/homebrew/Cellar/sampler/1.1.0/bin/sampler --config && /opt/homebrew/Cellar/sampler/1.1.0/config.yml'

## OS heuristics
alias apps='cd /Applications/ && open .'
alias brave='open -a "Brave Browser.app"'
alias saf='open -a "Safari.app"'

## environment management
alias ca='conda activate'
alias cat='bat'
alias catg='cat --style grid'

#                 @@@@@@@@@@     
#              @@@@@@@@@@@@@@@@  
#             @@@@@@@@@@@@@@@@@@ 
#            @@@@@@@@@@@@@@@@@@@@
#            @@@@@@@      @@@@@@@
#                         @@@@@@@
#            @@@@@@@      @@@@@@@
#            @@@@@@@@@@@@@@@@@@@@
#             @@@@@@@@@@@@@@@@@@ 
#              @@@@@@@@@@@@@@@@  
#                 @@@@@@@@@@     
alias uber='brave "https://m.uber.com/go/pickup"'

alias spt='open -a "Spotify.app" && /opt/homebrew/bin/spt'

# wspt -l pt $1 | say --voice='Luciana'
# wsen -l en $1 | say --voice='#'
# \cat file.md cat| tail -n +2| head (last_lines) | exlude characters ; , . -  | ignore everything in between HTML tags "<>" < > |say --voice='Luciana' # this cats the file, removes the first line, removes the last lines, removes the characters, removes the HTML tags, and then says it.

alias r='ranger --profile'
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias z.='z ../.'
alias z..='z ../../.'
alias z...='z ../../../.'

alias ls='lsd -lha --color=auto'

alias code='/opt/homebrew/bin/code-insiders --reuse-window'

alias dots='cd $HOME/lab/dotfiles && \ls && \cat zsh/.zshrc | head -n 24' # | tail -n 20' # + color, remove "#", and add "echo "⚉"
alias sdots='cp ~/lab/dotfiles/zsh/.zshrc ~/.zshrc && source ~/.zshrc' # solve dots
alias spot_blanks="grep -n '[[:blank:]]$' ~/.zshrc"


alias dl='cd $HOME/Downloads && tree && ls'
alias pics='cd $HOME/Pictures && tree && ls'

alias mail='ls /Users/$USER/Applications/Brave\ Browser\ Apps.localized/ | rg "mail" && sleep 1 && open /Users/$USER/Applications/Brave\ Browser\ Apps.localized/mail*'

alias wgls='sudo ls /etc/wireguard'
alias wgup='sudo wg-quick up ${1}'
alias wgdown='sudo wg-quick down ${1}'
alias wgc='sudo wg-quick up infinite && sleep 1200 && sudo wg-quick down infinite' # opens and closes a connection to `infinite` for 20 minutes -- to be moved to `.zshrc.local`

alias inf='cd ~/lab/infinite.sx/ && \cat infinite.sx.logo.ascii.trademark'

alias infaliases='\cat ~/.zshrc | rg "alias inf"'

alias infapps='ls /Users/$USER/Applications/Brave\ Browser\ Apps.localized/ | rg "infinite.sx" && sleep 2 && open /Users/$USER/Applications/Brave\ Browser\ Apps.localized/infinite.sx*'

alias infcal='gcalcli search "infinite.sx" | rg "<>" && gcalcli search "Infinite" | rg "G"'

alias infint="cd ~/lab/infinite.sx/ && \cat infinite.sx.logo.ascii.trademark && conda activate obb2 && interpreter --auto_run --model gpt-3.5-turbo-1106 --vision --disable_telemetry"

alias infmemo="cd ~/lab/infinite.sx/memos && \ls ../ | rg 'pipeline' && echo '🚀 INFINITE.SX memos ✅'"

alias infmini='\cat ~/lab/infinite.sx/logo.infinite.sx.shorthand.ascii.mini'

alias infrocket="cd $HOME/lab/infinite.sx && \cat logo.infinite.sx.rocket.ascii"

alias infspd='sudo ~/lab/infinite.sx/from_pipe_to_drive.sh' # a .md file is required as posterior input, e.g., `spd file.md`
alias infwb="infrocket && sleep 2 && infapps"

alias obb_update="z ~/lab/apps.github/OpenBBTerminal && git pull && hlmini"
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

alias pkc='pkc -f "Visual Studio Code - Insiders"'
alias pks='pkill -f "Spotify"'

alias lab="cd /Users/$USER/lab/ && lsd -lha --group-dirs first"

alias loadful='cd $HOME/lab/feausp-lab && source venv/bin/activate && ls'

alias warp='echo -e "$(\cat $(</Applications/Warp.app/Contents/Resources/assets/onboarding/welcome_to_warp.txt))"'

alias mixxx='/opt/homebrew/Caskroom/mixxx/2.3.3/Mixxx.app/Contents/MacOS/mixxx --developer'

alias x='exit'
alias o='open .'
alias s='ddgr --num 5 --unsafe --noua'
alias gd='gh dash'
alias tt='brave https://terminaltrove.com'
alias n='open -a "Notion.app"'
alias sl='open -a "Slack.app"'
alias sw='ddgr' #wiki
# alias xl='open -a "Microsoft Excel"'
# alias xlcl="osascript -e 'tell application \"Microsoft Excel\" to close every window'"
alias fcl="osascript -e 'tell application \"Finder\" to close every window'"

alias preview='open -a "Preview.app"'

alias obb='\cat ~/lab/headline/logo.headline.shorthand.ascii && sleep 1 && open -a "openbb.pro" && conda activate obb2 && python ~/lab/apps.github/OpenBBTerminal/terminal.py'

alias obbx='z /Users/gq/OpenBBUserData/exports && open $(fzf)'
alias cdobb='cd /Users/gq/.miniconda/envs/obb2/lib/python3.9/site-packages/openbb_terminal'
alias obb_update='/Users/$USER/.miniconda/envs/obb/bin/pip install --upgrade openbb'

alias brew_update='brew upgrade && brew outdated --cask && brew cleanup --prune=all && rm -rf "$(brew --cache)"'

alias richd='conda activate obb2 && rich --pager --markdown --line-numbers'
alias richdp='conda activate obb2 && rich --pager --emoji'
#alias scsh='cd /Users/$USER/google_drive_usp/gq_drive/mirror/screenshots && richd_pager "entering the screenshots :camera: directory" && tree && open .'

good_health() {
    brew_update
    lsvba && pip cache purge
    nix-collect-garbage && nix-collect-garbage -d && nix-store --gc
    conda clean --all -y
}

# OCR (Optical Character Recognition). The output is displayed using `rich`. Try `unalias ocr` in case of conflict.
ocr() {
    if [[ -z "$1" ]]; then
        echo "Usage: ocr <image-file>"
        return 1
    fi

    local input_file="$1"
    local output_file="tmp"

    shortcuts run ocr -i "$input_file" -o "$output_file" && richd "$output_file"
}

alias scsh2='cd /Users/$USER/google_drive_usp/gq_drive/mirror/screenshots && richd_pager ":camera:" && tree && open .'

alias stem='cd $HOME/lab/stem && tree'

alias svba='source venv/bin/activate'
alias lsvba='source ~/lab/lab_env/venv/bin/activate'

alias tmp='cd /tmp/'

alias vi='nvim'

alias std='reminders show todo'


# alias negimg='function __negimg() { local name=$(basename $1); local ext="${name##*.}"; convert $1 -negate "${name%.${ext}}.negative.${ext}"; }; __negimg'
# alias negimg='function __negimg() { local name=$(basename $1); local ext="${name##*.}"; convert $1 -negate "${name%.${ext}}.negative.${ext}"; }; __negimg'

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

alias cb='load cerradobaru && source && tree . && open && ranger && drive'

# alias rm='trash'

export LANG='en_US.UTF-8'

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

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

# source /Users/gq/apps.github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

## fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"

alias fn='nvim $(fzf)'
alias fo='open $(fzf)' # at `/opt/homebrew/bin/`
alias fzc='code-insiders --reuse-window $(fzf)'
alias fzg='glow $(fzf)'
alias fzcat='bat $(fzf)'

# export PATH=/opt/homebrew/bin/conda:$PATH

export PATH=/opt/homebrew/Caskroom/miniconda/base/envs/obb/etc/conda:$PATH

eval "$(zoxide init zsh)"

source /opt/homebrew/Caskroom/miniconda/base/envs/obb2/etc/conda

# export PATH="/usr/local/anaconda3/bin:$PATH"
# [[ -e "/usr/local/anaconda3/etc/profile.d/conda.sh" ]] && source "/usr/local/anaconda3/etc/profile.d/conda.sh"

export PATH="/opt/homebrew/bin/conda:$PATH"
[[ -e "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]] && source "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"

export DYLD_LIBRARY_PATH="/usr/local/lib:$DYLD_LIBRARY_PATH"

export PATH="/Users/gq/.cargo/bin:$PATH"

# source prefix/etc/profile.d/nix.sh

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# UNIX history, i.e. time travelling. mods also apply to `/etc/zshrc` `HIST` variables
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
HISTCONTROL=ignorespace
#export $HISTFILESIZE
#export $HISTSIZE

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
