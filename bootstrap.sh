#!/bin/sh

#-------------------------------------------------------------------------------
# Dotfiles
#-------------------------------------------------------------------------------

# Set temporary variable
DOTFILES=$HOME/dotfiles

# Update dotfiles itself first
[ -d "$DOTFILES/.git" ] && git --work-tree="$DOTFILES" --git-dir="$DOTFILES/.git" pull origin master

#-------------------------------------------------------------------------------
# Homebrew
#-------------------------------------------------------------------------------

# Check for Homebrew and install if it doesn't exist
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile # Install binary & applications
brew cleanup
brew cask cleanup

#-------------------------------------------------------------------------------
# Git
#-------------------------------------------------------------------------------

# Install global Git configuration
ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig

#-------------------------------------------------------------------------------
# Vim
#-------------------------------------------------------------------------------

# Install .vimrc
ln -nfs $DOTFILES/.vimrc $HOME/.vimrc

#-------------------------------------------------------------------------------
# Bash
#-------------------------------------------------------------------------------

# Install .bash_profile
ln -nfs $DOTFILES/.bash_profile $HOME/.bash_profile

# Install .bash_aliases
ln -nfs $DOTFILES/.bash_aliases $HOME/.bash_aliases
