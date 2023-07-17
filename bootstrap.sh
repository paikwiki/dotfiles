#!/bin/sh

#-------------------------------------------------------------------------------
# Dotfiles
#-------------------------------------------------------------------------------

# Set temporary variable
DOTFILES="$HOME/dotfiles"

#-------------------------------------------------------------------------------
# Zshrc
#-------------------------------------------------------------------------------

# Install .zshrc
ln -nfs $DOTFILES/.zshrc $HOME/.zshrc

#-------------------------------------------------------------------------------
# Homebrew
#-------------------------------------------------------------------------------

# Install if Homebrew is not exist
PATH="/opt/homebrew/bin:$PATH"
if [ ! -f "$(which brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile # Install binary & applications
brew cleanup
brew untap homebrew/cask

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
