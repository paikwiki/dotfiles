NPM_PACKAGES="$HOME/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

# git-radar https://github.com/michaeldfallen/git-radar
export PS1="$PS1\$(git-radar --bash --fetch)\n\$ "
export GIT_RADAR_COLOR_BRANCH='\033[0;32m'

if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion; fi
