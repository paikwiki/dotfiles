alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ls='ls -vGF'

# [chPaik@Changhyunui-MacBook-Pro ~]$
# PS1="[\u@\h \W]\\$ "
# [~]$
PS1="[\W]\\$ "

export PATH="/usr/local/mysql/bin:$PATH"

export PATH="$PATH:~/.composer/vendor/bin"

# MacPorts Installer addition on 2014-05-16_at_20:19:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# miniconda3
export PATH=~/miniconda3/bin:"$PATH"

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# docker
eval "$(docker-machine env default)"

source ~/.bashrc
export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/chPaik/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/chPaik/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/chPaik/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/chPaik/google-cloud-sdk/completion.bash.inc'
fi
