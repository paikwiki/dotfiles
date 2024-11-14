#!/bin/sh

#-------------------------------------------------------------------------------
# Dotfiles
#-------------------------------------------------------------------------------

# Set temporary variable
DOTFILES="${DOTFILES:-$HOME/dotfiles}"


#-------------------------------------------------------------------------------
# Zshrc
#-------------------------------------------------------------------------------

# Install .zshrc
ln -nfs $DOTFILES/.zshrc $HOME/.zshrc

#-------------------------------------------------------------------------------
# Homebrew
#-------------------------------------------------------------------------------

# Install if Homebrew is not exist (for Silicon Mac)
PATH="/opt/homebrew/bin:$PATH"
if [ ! -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile # Install binary & applications
brew cleanup

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
mkdir -p "$HOME/.vim/backup" "$HOME/.vim/swap" "$HOME/.vim/undo"

# Install .vimrc
ln -nfs $DOTFILES/.vimrc $HOME/.vimrc

#-------------------------------------------------------------------------------
# NVM
#-------------------------------------------------------------------------------

# Create .nvm directory
mkdir -p ~/.nvm


#-------------------------------------------------------------------------------
# MacOS Preferences
#-------------------------------------------------------------------------------

# Enable backquote key usage when keyboard input is set to Korean
mkdir -p ~/Library/KeyBindings
cp $DOTFILES/KeyBindings/DefaultKeyBinding.dict ~/Library/KeyBindings/

#-------------------------------------------------------------------------------
# Install Apps from AppStore with mas-cli
#-------------------------------------------------------------------------------

mas install 937984704 # Amphetamine
mas install 497799835 # Xcode
