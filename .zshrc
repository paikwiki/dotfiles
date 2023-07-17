# -----------------------------------------------
# Runtime Configuration
# -----------------------------------------------

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

export LANG=en_US.UTF-8
export EDITOR='vim'
export TERM=xterm-256color

export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"

# -----------------------------------------------
# Homebrew
# -----------------------------------------------

eval "$(/opt/homebrew/bin/brew shellenv)"

# -----------------------------------------------
# Python
# -----------------------------------------------

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# -----------------------------------------------
# Ruby
# -----------------------------------------------

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# -----------------------------------------------
# Rust
# -----------------------------------------------

. "$HOME/.cargo/env"

# -----------------------------------------------
# Node
# -----------------------------------------------

export NVM_DIR="$HOME/.nvm"
. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# -----------------------------------------------
# Google Cloud SDK
# -----------------------------------------------

# updates PATH for the Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
    . "$HOME/google-cloud-sdk/path.zsh.inc";
fi
# enables shell command completion for gcloud
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
    . "$HOME/google-cloud-sdk/completion.zsh.inc";
fi

# -----------------------------------------------
# Aliases
# -----------------------------------------------

# Python
alias python="python3"
alias py="python3"

# Variables
DEVPATH="$HOME/codes"
ICLOUDPATH="$HOME/Library/Mobile\ Documents/com~apple~CloudDocs"

# command
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ls="ls -vGF"
alias ll="ls -al"
alias realias=". $HOME/.bash_aliases"

# Directory
alias dcode="cd $DEVPATH"
alias dicloud="cd $ICLOUDPATH"
alias dblog="cd $ICLOUDPATH/paikwiki.github.io/"
alias here="open $(pwd)"

# Open folder with VS Code
alias memo="code $ICLOUDPATH/00-memo"
alias blog="code $ICLOUDPATH/paikwiki.github.io/"

# check ip address
alias ipcheck="ifconfig | egrep '(^\\w|inet )'"
alias myip=ipcheck

# Git
alias gs="git status"
alias gl="git log --oneline"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"
alias gd="git diff"
alias gbd="git branch -d"
alias gcln="git clone"
alias gchk="git checkout"
alias gchkb="git checkout -b"
alias gpull="git pull"
alias gpush="git push"
alias gstash="git stash"
alias gconfig="git config"

# Gitmoji
alias gmj="gitmoji -c"

# Docker
alias dk="docker"
alias dkp="docker ps"
alias dki="docker image"
alias dkis="docker images"

# Commands
alias mkdate="mkdir $(date '+%Y%m%d-%H%M%S')"
alias addlicense="license $1 > LICENSE"
alias cpwd="pwd|pbcopy"
alias trash="rmtrash"
alias sc="open -a ScreenSaverEngine"

# mkdir and cd
mkcdir () {
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}
alias mcd=mkcdir

# brightness control
alias br="$HOME/Applications/brightness $1"

# browser-sync with target directory
bsync () {
	browser-sync start --server --startPath="$1"
}
alias bsync=bsync

# volume control
volumecontrol() {
	osascript -e "set volume $1"
}
alias vol=volumecontrol

# leak check
loopleakcheck () {
	while true; do leaks $1; sleep 1.6; clear; done
}
#  usage: $loopleak APP
alias loopleak=loopleakcheck

# Good
alias good='echo "
      👍
"'

# Beep
alias beep='printf "\a"'
