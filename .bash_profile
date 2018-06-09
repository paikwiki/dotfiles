if [ -f ~/.bash_token ]; then
	. ~/.bash_token
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ls='ls -vGF'

# [chPaik@Changhyunui-MacBook-Pro ~]$
# PS1="[\u@\h \W]\\$ "
# [~]$
PS1="\e[38;5;20m \e[0m[\W]"

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

export PATH="/usr/local/mysql/bin:$PATH"
# export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH

export PATH="$PATH:~/.composer/vendor/bin"

# MacPorts Installer addition on 2014-05-16_at_20:19:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# docker
## eval "$(docker-machine env default)"

# rvenv 
eval "$(rbenv init -)"

source ~/.bashrc
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/chPaik/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/chPaik/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/chPaik/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/chPaik/google-cloud-sdk/completion.bash.inc'
fi
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
