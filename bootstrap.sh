#!/bin/sh

#-------------------------------------------------------------------------------
# Dotfiles
#-------------------------------------------------------------------------------

# Set temporary variable
DOTFILES="$HOME/dotfiles"

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
# Make ZSH the default shell environment
#-------------------------------------------------------------------------------

chsh -s $(which zsh)

#-------------------------------------------------------------------------------
# Git
#-------------------------------------------------------------------------------

# Install global Git configuration
ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
ln -nfs $DOTFILES/.gitignore_global $HOME/.gitignore_global

#-------------------------------------------------------------------------------
# Vim
#-------------------------------------------------------------------------------

# Create .vim directory
mkdir ~/.vim
mkdir ~/.vim/backup
mkdir ~/.vim/swap
mkdir ~/.vim/undo

# Install .vimrc
ln -nfs $DOTFILES/.vimrc $HOME/.vimrc


#-------------------------------------------------------------------------------
# NVM
#-------------------------------------------------------------------------------

# Create .nvm directory
mkdir ~/.nvm

#-------------------------------------------------------------------------------
# Ruby
#-------------------------------------------------------------------------------

rbenv install 2.7.2
rbenv global 2.7.2

#-------------------------------------------------------------------------------
# Install Apps from AppStore with mas-cli
#-------------------------------------------------------------------------------

mas install 937984704 # Amphetamine (5.1)
mas install 497799835 # Xcode (12.2)
mas install 929507092 # Photoscape X (4.1.1)
mas install 416746898 # HWP 2014 VP Viewer (10.30.6)
