#!/bin/sh

#-------------------------------------------------------------------------------
# Dotfiles
#-------------------------------------------------------------------------------

# Set temporary variable
DOTFILES="$HOME/dotfiles"

#-------------------------------------------------------------------------------
# Homebrew
#-------------------------------------------------------------------------------

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
# Install Apps from AppStore with mas-cli
#-------------------------------------------------------------------------------

mas install 937984704 # Amphetamine (5.1)
mas install 497799835 # Xcode (12.2)
