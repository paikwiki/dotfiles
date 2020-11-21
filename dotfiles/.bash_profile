export LANG=en_US.UTF-8
export EDITOR='vim'

# [chpaik@Changhyunui-MacBook-Pro ~]$
# PS1="[\u@\h \W]\\$ "
# [~]$
PS1="\e[38;5;20m \e[0m[\W]"

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH="/usr/local/flutter/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

eval "$(rbenv init -)"

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
