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
alias d42cursus="cd $DEVPATH/42cursus"
alias dblog="cd $ICLOUDPATH/paikwiki.github.io/"
alias dbook="cd $HOME/Documents/Writing/making-website-with-gh-pages/"

# Laravel
alias art="php artisan"
alias tinker="php artisan tinker"

# Python
alias py="python"

# Jekyll
alias jks="bundle exec jekyll serve --drafts --port 3000"

# Open folder with VS Code
alias memo="code $ICLOUDPATH/00-memo"
alias blog="code $ICLOUDPATH/paikwiki.github.io/"
alias ftprintf="code $DEVPATH/42cursus/ft-printf"
alias til="code $DEVPATH/42cursus/report.wiki"
alias libft="code $DEVPATH/42cursus/libft"
alias ftserver="code $DEVPATH/42cursus/ft-server"
alias cub3d="code $DEVPATH/42cursus/cub3d"
alias gnl="code $DEVPATH/42cursus/gnl"

# check ip address
alias ipcheck="ifconfig | egrep '(^\\w|inet )'"
alias myip=ipcheck

# Git
alias gs="git status"
alias gl="git log --oneline"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -am"
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

# Docker
alias dk="docker"
alias dkp="docker ps"
alias dki="docker image"
alias dkis="docker images"

# Kubernetes
alias kc="kubectl"
alias mk="minikube"

# 42
alias gcw="gcc -Wall -Wextra -Wall"
alias norminette="$HOME/.norminette/norminette.rb"
alias norm="norminette"

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

# browser-sync with target directory
bsync () {
	browser-sync start --server --startPath="$1"
}
alias bsync=bsync

# volume control
vol() {
	osascript -e "set volume $1"
}
alias vol=vol

# Good
alias good='echo "
      👍
"'

# 42 - Diagram for FT_SERVICES
export FTSERVICES="
                         FT_SERVICES - Kubernetes cluster

                                     ╭───────╮
                                     │ World │
                                     ╰───┬───╯
                                         │
                           ╭─────────────┷──────────╮
                           │ Load Balancer(MetalLB) │
                           ╰─────────────┬──────────╯
     ┌────────────┬────────────────────┬─┴────────────────────┬───────────┐
     │3000        │5050                │80/443/22             │5000       │21
╭────┷────╮ ╭─────┷─────╮ Redirect ╭───┷───╮ Reverse... ╭─────┷──────╮ ╭──┷───╮
│ Grafana │ │ WordPress ┠──────────┤ NginX ├────────────┨ PhpMyAdmin │ │ FTPS │
╰─┯─────┬─╯ ╰───┬────┯──╯          ╰───┬───╯            ╰─────┬─┯────╯ ╰──┬───╯
  │     │       │    └┐                │                      │ └┐   ┌────┘
  │data └─────┐ │     └────────────────┼──────────────────────┼──┴───┼──────┐
  │           │ │                      │                      │      │ data │
  │           │ │                      │                      │     ┌┘      │
┌─┴────────┐  │ │                      │                      │     │ ┌─────┷─┐
│ InfluxDB ┠──┴─┴──────────────────────┴──────────────────────┴─────┴─┤ MySQL │
└──────────┘ Metrics                                                  └───────┘

"

alias ftservices='echo "$FTSERVICES"'