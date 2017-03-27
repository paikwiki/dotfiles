#!/bin/sh

#-------------------------------------------------------------------------------
# Thanks Appkr! https://github.com/appkr/dotfiles/blob/master/bootstrap.sh
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Set temporary variable
#-------------------------------------------------------------------------------

DOTFILES=$HOME/dotfiles

#-------------------------------------------------------------------------------
# Update dotfiles itself first
#-------------------------------------------------------------------------------

[ -d "$DOTFILES/.git" ] && git --work-tree="$DOTFILES" --git-dir="$DOTFILES/.git" pull origin master

#-------------------------------------------------------------------------------
# Check for Homebrew and install if it doesn't exist
#-------------------------------------------------------------------------------

if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#-------------------------------------------------------------------------------
# Update Homebrew recipes
#-------------------------------------------------------------------------------

brew update

#-------------------------------------------------------------------------------
# Install all our dependencies with bundle (See Brewfile)
#-------------------------------------------------------------------------------

brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile # Install binary & applications
brew cleanup
brew cask cleanup

#-------------------------------------------------------------------------------
# Install global Git configuration
#-------------------------------------------------------------------------------

ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
git config --global core.excludesfile $DOTFILES/.gitignore_global
git config --global user.name "paikwiki"
git config --global user.email "paikwiki@gmail.com"

#-------------------------------------------------------------------------------
# Install Mackup config
#-------------------------------------------------------------------------------

[ ! -f $HOME/.mackup.cfg ] && ln -nfs $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

#-------------------------------------------------------------------------------
# Install .vimrc
#-------------------------------------------------------------------------------

ln -nfs $DOTFILES/.vimrc $HOME/.vimrc

#-------------------------------------------------------------------------------
# Install .bash_profile
#-------------------------------------------------------------------------------

ln -nfs $DOTFILES/.bash_profile $HOME/.bash_profile

#-------------------------------------------------------------------------------
# Install .bash_aliases
#-------------------------------------------------------------------------------

ln -nfs $DOTFILES/.bash_aliases $HOME/.bash_aliases

#-------------------------------------------------------------------------------
# Install Composer
#-------------------------------------------------------------------------------

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

#-------------------------------------------------------------------------------
# Install global Composer packages
#-------------------------------------------------------------------------------

/usr/local/bin/composer global require laravel/installer laravel/envoy

#-------------------------------------------------------------------------------
# Install global Node packages
#-------------------------------------------------------------------------------

npm install gulp-cli gulp yo http-server nodemon --global --save
npm install gitbook-cli --global --save

#-------------------------------------------------------------------------------
# Install Rails & Jekyll
#-------------------------------------------------------------------------------

# I can't install gems because of permission
# gem install pry rails jekyll bundler

#-------------------------------------------------------------------------------
# Source profile
#-------------------------------------------------------------------------------

# source $HOME/.zshrc

#-------------------------------------------------------------------------------
# Set OS X preferences
# We will run this last because this will reload the shell
#-------------------------------------------------------------------------------

# source $DOTFILES/.osx
