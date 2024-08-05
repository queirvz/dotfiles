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
#                                        ###*#@    %%%###a
#                                         @%%###    @#####
#                                         %%###@   @####%
#                                         @#####    #%%*%@
#                                          %#%%#    %#####
#                                          #%%#%@    ####%
#                                          @#%###    %%####
#                                           ##%##    @####%
#                                           %*###%   #%%%#%
#                                            %%###%@%%%##%
#                                             ###*%%%%##@
#                                               @%####%      2024.v_10^3


# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Environment Variables
export PATH=/Users/$USER/.local/bin:$PATH
export PATH=/Users/$USER/lab/lab_env/venv/lib/python3.11/site-packages:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/go/bin
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.miniconda/bin:$PATH"
export PATH=/opt/homebrew/Caskroom/miniconda/base/envs/obb/etc/conda:$PATH
export PATH="/Users/gq/.cargo/bin:$PATH"
export DYLD_LIBRARY_PATH="/usr/local/lib:$DYLD_LIBRARY_PATH"
export LANG='en_US.UTF-8'
export ZSH="$HOME/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters


# ZSH Options
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 60
zstyle ':completion:*:messages' format '%F{green}...%f'


# Plugins
plugins=(
    brew
    # charm
    colored-man-pages
    colorize
    git
    # go
    # marp
    osx
    # pip
    python
    vi-mode
    # vscode-insiders
    z
    # zsh-autopair
    # zsh-autosuggestions
    # zsh-completions
    # zsh-syntax-highlighting
    zsh-vi-mode
)


# Source plugins and themes
# zinit light zsh-users/zsh-completions
# zinit ice depth=1; zinit light zdharma/fast-syntax-highlighting
# zinit ice depth=1; zinit light romkatv/powerlevel10k


# Key Bindings
bindkey -v
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect '^?' backward-delete-char


# Initialize Homebrew and McFly
eval $(/opt/homebrew/bin/brew shellenv)
eval "$(mcfly init zsh)"


# Conda Initialization
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

## Source additional scripts
source /opt/homebrew/Caskroom/miniconda/base/envs/obb2/etc/conda
# source /Users/gq/apps.github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Initialize zoxide
eval "$(zoxide init zsh)"


# Initialize fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Function Definitions
negimg() {
  local name=$(basename "$1")
  local ext="${name##*.}"
  convert "$1" -negate "${name%.$ext}.negative.$ext"
}

convert_to_negative() {
  if [ $# -ne 1 ]; then
    echo "Usage: convert_to_negative <input_image>"
    return 1
  fi

  local input_image="$1"
  local output_image="${input_image%.*}_negative.${input_image##*.}"
  convert "$input_image" -negate "$output_image"
  echo "Image converted to negative and saved as '$output_image'"
}

negpdf() {
  local input="$1"
  local output="${input%.pdf}.inverted.pdf"
  gs -o "$output" -sDEVICE=pdfwrite -c "{1 exch sub}{1 exch sub}{1 exch sub}{1 exch sub} setcolortransfer" -f "$input"
}

good_health() {
    brew_update
    lsvba && pip cache purge
    nix-collect-garbage && nix-collect-garbage --delete-old --log-format internal-json && nix-store --gc
    npm install -g npm@latest
}

ocr() {
    if [[ -z "$1" ]]
    then
        echo "Usage: ocr <image-file>"
        return 1
    fi
    local input_file="$1"
    local output_file="output.txt"

    if ! shortcuts run ocr -i "$input_file" -o "$output_file"; then
        echo "OCR failed on $input_file"
        return 1
    fi

    conda activate obb2

    if ! rich --pager --markdown --line-numbers "$output_file"; then
        echo "Failed to display $output_file"
        return 1
    fi
}

ride() {
  \cat << "EOF"
                 @@@@@@@@@@
              @@@@@@@@@@@@@@@@
             @@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@
            @@@@@@@      @@@@@@@
                         @@@@@@@
            @@@@@@@      @@@@@@@
            @@@@@@@@@@@@@@@@@@@@
             @@@@@@@@@@@@@@@@@@
              @@@@@@@@@@@@@@@@
                 @@@@@@@@@@
EOF
  sleep 2 && brave "https://m.uber.com/go/pickup"
}

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

speedia() {
    \cat << "EOF"
             :::::::::::::  ::::::::::::           :::::::::::::::::::: :::::::::::::::::::: :::::::::::           :::::::::::::::::          ::::
          :::::::::::::::: ::::::::::::::::       ::::::::::::::::::::  :::::::::::::::::::  ::::::::::::::::      :::::::::::::::::         :::::
       ::::::::::::::::::: ::::::::::::::::::     :::::::::::::::::::: ::::::::::::::::::::  ::::::::::::::::::    :::::::::::::::::        ::::::
      :::::::::::::::::::  :::::::::::::::::::    :::::::::::::::::::: :::::::::::::::::::: ::::::::::::::::::::  :::::::::::::::::        ::::::::
     :::::::::            :::::::     :::::::::  :::::::               :::::::              :::::::    :::::::::::     :::::::            :::::::::
     :::::::              :::::::       :::::::: :::::::              :::::::               ::::::        ::::::::     :::::::           ::::::::::
     :::::::              :::::::        ::::::: :::::::              :::::::              :::::::         ::::::::   :::::::           :::::::::::
     ::::::::            :::::::         ::::::::::::::               :::::::              :::::::          :::::::   :::::::          ::::::::::::
     :::::::::::         :::::::        ::::::: :::::::::::::::::    :::::::::::::::::     ::::::           :::::::   :::::::          :::::::::::::
      ::::::::::::       ::::::        :::::::: :::::::::::::::::    :::::::::::::::::    :::::::           :::::::  :::::::          ::::::::::::::
        ::::::::::::    :::::::       :::::::: ::::::::::::::::::    :::::::::::::::::    :::::::           :::::::  :::::::         :::::::  ::::::
           ::::::::::   :::::::    ::::::::::  :::::::::::::::::    ::::::::::::::::::   :::::::           :::::::   :::::::        :::::::   ::::::
             :::::::::  ::::::::::::::::::::   :::::::              :::::::              :::::::          ::::::::  :::::::        :::::::    :::::::
               ::::::: ::::::::::::::::::     :::::::               ::::::               :::::::         ::::::::   :::::::       :::::::::::::::::::
              :::::::  ::::::::::::::::       :::::::              :::::::              :::::::       ::::::::::    :::::::      ::::::::::::::::::::
             ::::::::  ::::::::::::           :::::::              :::::::              :::::::    :::::::::::     :::::::      :::::::::::::::::::::
 :::::::::::::::::::  :::::::                ::::::::::::::::::::  :::::::::::::::::::  ::::::::::::::::::::  ::::::::::::::::::::::::::     ::::::::
 :::::::::::::::::    :::::::                :::::::::::::::::::: :::::::::::::::::::: :::::::::::::::::::   :::::::::::::::::::::::::        ::::::::
:::::::::::::::::     ::::::                 :::::::::::::::::::: :::::::::::::::::::: ::::::::::::::::      ::::::::::::::::::::::::          :::::::
::::::::::::::       :::::::                ::::::::::::::::::::  :::::::::::::::::::  ::::::::::::          :::::::::::::::::::::::           :::::::
EOF
    sleep 4 && saf "https://speedia.net/" && control ; os ; speediademo ; speediagh
    }

alias control='saf "https://speedia.net/control/"'
alias os='saf "https://speedia.net/os/"'
alias speediademo='saf "https://os.demo.speedia.net:1618/_/#/"'
alias speediagh='saf https://github.com/speedianet/os'


## Aliases
alias a='cd /Applications && open "$(\ls -d *.app | fzf)"'

alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias apps='cd /Applications/ && ranger .'
alias arc='open -a Arc.app'
alias blanks="rg -n '[[:blank:]]$' ~/.zshrc"
alias b='brave'
alias brave='open -a "Brave Browser.app"'
alias brew_update='brew upgrade && brew outdated --cask && brew cleanup --prune=all && rm -rf "$(brew --cache)"'
alias cat='bat'
alias catg='bat --style grid'

alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'

alias chad='open -a ChatGPT.app'
alias code='/opt/homebrew/bin/code-insiders --reuse-window'

alias csh="cd $HOME/lab/csh && cat csh_ascii | head -n 15 | tail -n 10"
alias cshind="cd $HOME/lab/csh && cat csh_ascii | head -n 15 | tail -n 10 && cat csh_ascii | head -n 21 | tail -n 3"
alias cn="\cat ~/lab/csh/csh.asc_logo.txt"

alias d='cd $HOME/Downloads && tree && ls'
alias dol='cd $HOME/Downloads && file=$(lsd --timesort --group-dirs last | head -1) ; echo "Opening $file" && sleep 1 ; open "$file"' # downloads_open_last
alias dots='cd $HOME/lab/dotfiles && \ls && jewels'
alias f='open $(fzf)' # at /opt/homebrew/bin/
alias fcl="osascript -e 'tell application \"Finder\" to close every window'"
alias fg='glow $(fzf)'
alias fn='nvim $(fzf)'
alias fs='sioyek $(fzf)'
alias fzb='bat $(fzf)'
alias fzc='code-insiders --reuse-window $(fzf)'
alias ft="osascript -e 'tell app \"FaceTime\" to activate'"
alias gd='gh dash'
alias h='history 1 | rg $1'
alias hnl='brave https://hackernews.com/ && brave https://lobste.rs/'
alias ic='brave https://www.icloud.com/'
alias inf='cd ~/lab/infinite.sx/ && \cat infinite.sx.logo.ascii.trademark'
alias infaliases='\\cat ~/.zshrc | rg "alias inf"'
alias infapps='ls /Users/$USER/Applications/Brave\ Browser\ Apps.localized/ | rg "infinite.sx" && sleep 2 && open /Users/$USER/Applications/Brave\ Browser\ Apps.localized/infinite.sx*'
alias infcal='gcalcli search "infinite.sx" | rg "<>" && gcalcli search "Infinite" | rg "G"'
alias infmemo="cd ~/lab/infinite.sx/memos && \ls . | rg 'pipeline' && echo '🚀 INFINITE.SX memos ✅'"
alias infmini='\\cat ~/lab/infinite.sx/logo.infinite.sx.shorthand.ascii.mini'
alias infrocket="cd $HOME/lab/infinite.sx && \cat logo.infinite.sx.rocket.ascii"
alias infspd='sudo ~/lab/infinite.sx/from_pipe_to_S3.sh' # a .md file is required as posterior input, e.g., infspd infinite.sx.pipeline.file_name.md
alias infwb="infrocket && sleep 2 && infapps"
alias jewels='\cat $HOME/lab/dotfiles/zsh/.zshrc | head -n 24 | sed "s/^[^ ]* //"'
alias jup='nix-shell -p jupyter'
alias lab="cd /Users/$USER/lab/ && lsd -lha --group-dirs first"
alias llama='brave "https://duckduckgo.com/?q=DuckDuckGo+AI+Chat\&ia=chat\&duckai=1/"'
alias loadful='cd $HOME/lab/feausp-lab && source venv/bin/activate && ls'
alias locals="\cat ~/.zshrc.local"
alias lst='lsd -lha --timesort --group-dirs last'
alias lsti='lsd -lha --timesort --group-dirs last | rg "infinite"'
alias lsvba='source ~/lab/lab_env/venv/bin/activate'
alias mail='\ls /Users/$USER/Applications/Brave\ Browser\ Apps.localized/ | rg "mail" && sleep 1 && open /Users/$USER/Applications/Brave\ Browser\ Apps.localized/mail*'
alias mixxx='/opt/homebrew/Caskroom/mixxx/2.4.1/Mixxx.app/Contents/MacOS/mixxx --developer'
alias n='open -a Notion.app'
alias na="cd /Users/$USER/lab/apps.nix && \ls && neofetch --ascii_distro 'nixos' --logo" # nix apps
alias ob='open -a Obsidian.app'
alias obb_update="z ~/lab/apps.github/OpenBBTerminal && git pull"
alias obbx='z /Users/gq/OpenBBUserData/exports && open $(fzf)'
alias ol='file=$(lsd --timesort --group-dirs last | head -1) ; open "$file"' # open_last
alias o='open .'
alias p='open -a Preview.app'
alias pkc='pkc -f "Visual Studio Code - Insiders"'
alias pks='pkill -f "Spotify"'
alias r='ranger --profile'
alias rg="rg --multiline-dotall --line-number --colors 'match:bg:0,0,100'"
alias saf='open -a Safari.app'
alias sampler='/opt/homebrew/Cellar/sampler/1.1.0/bin/sampler --config && /opt/homebrew/Cellar/sampler/1.1.0/config.yml'
alias scsh='cd /Users/$USER/Library/Mobile\ Documents/com~apple~CloudDocs/single_source_of_trust/screenshots && \ls && open .'
alias sdots='cp $HOME/lab/dotfiles/zsh/.zshrc ~/.zshrc && source ~/.zshrc && jewels' # solve_dots
alias sl='open -a Slack.app'
# alias spt='open -a "Spotify.app" && sleep 2 && /opt/homebrew/bin/spt && open -a "lofi.app" && osascript -e \'tell application \"Warp\" to activate\''
alias s='ddgr --num 5 --unsafe --noua'
alias sw='ddgr' # search web
alias stem='cd $HOME/lab/stem && tree'
alias svba='source venv/bin/activate'
alias td='reminders show todo'
alias tmp='cd /tmp/'
alias tt='brave https://terminaltrove.com/'
alias uber='ride'
alias vi='nvim'
# alias warp='osascript -e \'tell application \"Warp\" to activate\''
alias wgls='sudo ls /etc/wireguard'
alias wgup='sudo wg-quick up ${1}'
alias wgdown='sudo wg-quick down ${1}'
alias wgc='sudo wg-quick up infinite && sleep 1200 && sudo wg-quick down infinite' # opens and closes a connection to infinite for 20 minutes -- to be moved to .zshrc.local
alias wht='brave https://www.webhostingtalk.com/'
alias wpp='open -a WhatsApp.app'
alias x='exit'
alias z.='z ../'
alias z..='z ../../'
alias z...='z ../../../'
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

# Custom Aliases for Efficiency and Creativity
alias g='git'
alias gs='git status'
alias gp='git pull'
alias gpo='git push origin'
alias gco='git checkout'
alias gc='git commit -m'
alias ga='git add .'
alias gl='git log --oneline --graph --decorate --all'
alias src='source ~/.zshrc'
alias cls='clear'
alias b64enc='base64 | pbcopy'
alias b64dec='pbpaste | base64 --decode'
alias mkd='mkdir -p'
alias psg='ps aux | grep'
alias path='echo -e ${PATH//:/\\n}'
alias now='date "+%Y-%m-%d %H:%M:%S"'
alias week='date +%V'
alias epoch='date +%s'
alias reload='exec $SHELL -l'
alias please='sudo'
alias dnstop='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias update='brew update && brew upgrade && brew cleanup'
alias hist='fc -l 1'
alias cls='clear'
alias pipup='pip list --outdated --format=columns'
alias cleanup='brew cleanup && npm cache clean --force && yarn cache clean && rm -rf ~/.cache/pip'
alias openports='sudo lsof -i -P | grep LISTEN'
alias meminfo='top -l 1 -s 0 | grep PhysMem'
alias cpuinfo='sysctl -n machdep.cpu.brand_string'
alias top10='ps aux | sort -nrk 3,3 | head -10'
alias iplocal='ipconfig getifaddr en0'
alias ippublic='curl ifconfig.me'

# Alias Enhancements
alias brewcaskup='brew update && brew upgrade --cask && brew cleanup'
alias pipfreez='pip freeze > requirements.txt'
alias rmnode_modules='find . -name "node_modules" -type d -prune -exec rm -rf '{}' +'
alias lock='gnome-screensaver-command -l'
alias update_all='brew update && brew upgrade && brew cleanup && npm update -g && gem update && pip list --outdated --format=columns'
alias docker_clean='docker system prune -af && docker volume prune -f'
alias mkvenv='python3 -m venv venv && source venv/bin/activate && pip install --upgrade pip'

# Useful One-liners
alias serve='python3 -m http.server'
alias extract='tar xvf'
alias recentfiles='ls -lt | head'
alias myip='curl http://ipecho.net/plain; echo'
alias hosts='sudo vim /etc/hosts'
alias reloadshell='exec $SHELL -l'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs, plugins, and themes. Aliases can be placed here, though oh-my-zsh users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Source Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fuzzy Finder and Zoxide Initialization
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# UNIX History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
HISTCONTROL=ignorespace
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# Function Definitions (continued)
# ... (repeating the existing functions for completeness)
negimg() {
  local name=$(basename "$1")
  local ext="${name##*.}"
  convert "$1" -negate "${name%.$ext}.negative.$ext"
}

convert_to_negative() {
  if [ $# -ne 1 ]; then
    echo "Usage: convert_to_negative <input_image>"
    return 1
  fi

  local input_image="$1"
  local output_image="${input_image%.*}_negative.${input_image##*.}"
  convert "$input_image" -negate "$output_image"
  echo "Image converted to negative and saved as '$output_image'"
}

negpdf() {
  local input="$1"
  local output="${input%.pdf}.inverted.pdf"
  gs -o "$output" -sDEVICE=pdfwrite -c "{1 exch sub}{1 exch sub}{1 exch sub}{1 exch sub} setcolortransfer" -f "$input"
}

good_health() {
    brew_update
    lsvba && pip cache purge
    nix-collect-garbage && nix-collect-garbage --delete-old --log-format internal-json && nix-store --gc
    npm install -g npm@latest
}

ocr() {
    if [[ -z "$1" ]]; then
        echo "Usage: ocr <image-file>"
        return 1
    fi

    local input_file="$1"
    local output_file="tmp"

    shortcuts run ocr -i "$input_file" -o "$output_file" && richd "$output_file"
}

ocr2() {
    if [[ -z "$1" ]]
    then
        echo "Usage: ocr <image-file>"
        return 1
    fi
    local input_file="$1"
    local output_file="output.txt"

    if ! shortcuts run ocr -i "$input_file" -o "$output_file"; then
        echo "OCR failed on $input_file"
        return 1
    fi

    conda activate obb2

    if ! rich --pager --markdown --line-numbers "$output_file"; then
        echo "Failed to display $output_file"
        return 1
    fi
}

# Private Boilerplates
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

#                   _-_
#                /~~   ~~\
#             /~~         ~~\
#            {               }
#             \  _-     -_  /
#               ~  \\ //  ~
#            _- -   | | _- _
#              _ -  | |   -_
#                  // \\