# -----------------------------------------------
# Runtime Configuration
# -----------------------------------------------
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR='vim'
export TERM=xterm-256color

# -----------------------------------------------
# check installed applications
# -----------------------------------------------

# Function to check if a command exists
check_command() {
  command -v "$1" >/dev/null 2>&1
}

# Initialize an array to store missing applications
missing_apps=()
if ! check_command brew; then
  missing_apps+=("Homebrew")
fi
if ! check_command git; then
  missing_apps+=("Git")
fi
if ! [ -f "/opt/homebrew/bin/githud" ]; then # TODO: GitHud 설치하는 스크립트 생성(+Brightness)
  missing_apps+=("Githud")
fi
if ! check_command pyenv; then
  missing_apps+=("Pyenv")
fi
if ! check_command rbenv; then
  missing_apps+=("Rbenv")
fi
if ! [ -d "$HOME/.nvm" ]; then
  missing_apps+=("NVM")
fi
if ! [ -d "$HOME/google-cloud-sdk" ]; then
  missing_apps+=("Google Cloud SDK")
fi
if ! check_command poetry; then
  missing_apps+=("Poetry")
fi
if ! check_command gitmoji; then
  missing_apps+=("Gitmoji")
fi
if ! [ -f "/usr/local/bin/brightness" ]; then
  missing_apps+=("Brightness")
fi
if ! check_command docker; then
  missing_apps+=("Docker")
fi

# Display missing applications if any
if [ ${#missing_apps[@]} -gt 0 ]; then
  echo "\033[1;33mWarning: Some required applications are missing:\033[0m"
  for app in "${missing_apps[@]}"; do
    echo "  - $app"
  done
  echo ""
fi

# -----------------------------------------------
# Homebrew
# -----------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

export LDFLAGS="-L/opt/homebrew/opt/libffi/lib -L$(brew --prefix tcl-tk@8)/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include -I$(brew --prefix tcl-tk@8)/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$(brew --prefix tcl-tk@8)/lib/pkgconfig"
export PATH="$(brew --prefix tcl-tk@8)/bin:$PATH"

# -----------------------------------------------
# iTerm2
# -----------------------------------------------
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# ↑
bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
bindkey '^P' history-beginning-search-backward
# ↓
bindkey "${terminfo[kcud1]}" history-beginning-search-forward
bindkey '^N' history-beginning-search-forward

# -----------------------------------------------
# VS Code terminal
# -----------------------------------------------

# https://github.com/microsoft/vscode-docs/issues/5221#issuecomment-1061081538
bindkey -e

# -----------------------------------------------
# Prompt
# -----------------------------------------------
NEWLINE=$'\n'
export PATH="$HOME/.git-radar:$PATH"
export PROMPT="%F{33}🚌 %f%F{250}[%f%F{33}%~%f%F{250}]%f"
export PROMPT="$PROMPT\$(git-radar --zsh --fetch)${NEWLINE}%F{78}%n%f$ "
setopt PROMPT_SUBST

# -----------------------------------------------
# Python
# -----------------------------------------------
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# -----------------------------------------------
# Ruby (rbenv + Homebrew Ruby + GEM_HOME)
# -----------------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.gem/bin:$PATH"
eval "$(rbenv init -)"

# -----------------------------------------------
# Node
# -----------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# -----------------------------------------------
# Google Cloud SDK(install manually)
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
# Poetry
# -----------------------------------------------
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# -----------------------------------------------
# Aliases
# -----------------------------------------------
# Python
alias python="python3"
alias py="python3"

# command
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ls="ls -vGF"
alias ll="ls -al"

# check ip address
alias myip='echo "$(curl -s ifconfig.me)"'

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
alias cpwd="pwd|pbcopy"
alias sc="open -a ScreenSaverEngine"

# brightness control
alias br="/usr/local/bin/brightness $1"
# Good
alias good='echo "
      👍
"'

# Beep
alias beep='printf "\a"'

# -----------------------------------------------
# Aliases - Functions
# -----------------------------------------------
# mkdir and cd
mkcdir () {
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}
alias mcd=mkcdir

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


# load .zsh_alias for aliases
if [ -f ~/.zsh_alias ]; then
		source ~/.zsh_alias
fi


