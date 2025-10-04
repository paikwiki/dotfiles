#!/bin/sh

#-------------------------------------------------------------------------------
# Dotfiles
#-------------------------------------------------------------------------------

# Set temporary variable
DOTFILES="$HOME/dotfiles"
CURRENT_DATE=$(date '+%Y%m%d-%H%M%S')
BACKUP_DIR="$HOME/dotfiles_backup_$CURRENT_DATE"

echo "📦 Setting up dotfiles..."
mkdir -p $BACKUP_DIR

#-------------------------------------------------------------------------------
# Backup existing files
#-------------------------------------------------------------------------------

echo "💾 Creating backups of existing configuration files..."
if [ -f "$HOME/.zshrc" ]; then
  cp "$HOME/.zshrc" "$BACKUP_DIR/.zshrc.bak"
fi
if [ -f "$HOME/.gitconfig" ]; then
  cp "$HOME/.gitconfig" "$BACKUP_DIR/.gitconfig.bak"
fi
if [ -f "$HOME/.gitignore_global" ]; then
  cp "$HOME/.gitignore_global" "$BACKUP_DIR/.gitignore_global.bak"
fi
if [ -f "$HOME/.vimrc" ]; then
  cp "$HOME/.vimrc" "$BACKUP_DIR/.vimrc.bak"
fi

#-------------------------------------------------------------------------------
# Zshrc
#-------------------------------------------------------------------------------

echo "🐚 Installing .zshrc..."
ln -nfs $DOTFILES/.zshrc $HOME/.zshrc

#-------------------------------------------------------------------------------
# Homebrew
#-------------------------------------------------------------------------------

echo "🍺 Setting up Homebrew..."
PATH="/opt/homebrew/bin:$PATH"
if [ ! -f "$(which brew)" ]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
echo "Updating Homebrew recipes..."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing Homebrew packages from Brewfile..."
brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile # Install binary & applications
brew cleanup

#-------------------------------------------------------------------------------
# Git
#-------------------------------------------------------------------------------

echo "🌿 Setting up Git configuration..."
# Install global Git configuration
ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
ln -nfs $DOTFILES/.gitignore_global $HOME/.gitignore_global

#-------------------------------------------------------------------------------
# Vim
#-------------------------------------------------------------------------------

echo "📝 Setting up Vim configuration..."
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo

# Install .vimrc
ln -nfs $DOTFILES/.vimrc $HOME/.vimrc

#-------------------------------------------------------------------------------
# Python - Pyenv
#-------------------------------------------------------------------------------

echo "🐍 Setting up Python environment..."
eval "$(pyenv init -)"

#-------------------------------------------------------------------------------
# Ruby - Rbenv
#-------------------------------------------------------------------------------

echo "💎 Setting up Ruby environment..."
eval "$(rbenv init -)"

#-------------------------------------------------------------------------------
# Node - NVM
#-------------------------------------------------------------------------------

echo "📦 Setting up Node environment..."
mkdir -p ~/.nvm

#-------------------------------------------------------------------------------
# Google Cloud SDK
#-------------------------------------------------------------------------------

echo "☁️ Setting up Google Cloud SDK..."
if ! [ -d "$HOME/google-cloud-sdk" ]; then
  echo "Installing Google Cloud SDK..."
  curl https://sdk.cloud.google.com > /tmp/install.sh
  bash /tmp/install.sh --disable-prompts
  rm /tmp/install.sh
fi

#-------------------------------------------------------------------------------
# Poetry
#-------------------------------------------------------------------------------

echo "📜 Setting up Poetry..."
# Install Poetry if not included in Brewfile
curl -sSL https://install.python-poetry.org | python3 -

#-------------------------------------------------------------------------------
# Gitmoji
#-------------------------------------------------------------------------------

echo "😎 Setting up Gitmoji..."
# Install Gitmoji CLI globally
npm install -g gitmoji-cli

#-------------------------------------------------------------------------------
# Brightness
#-------------------------------------------------------------------------------

echo "💡 Setting up Brightness control..."
# Install brightness tool from source
sh $DOTFILES/scripts/install_brightness.sh

#-------------------------------------------------------------------------------
# MacOS Preferences
#-------------------------------------------------------------------------------

echo "⌨️  Setting up macOS KeyBindings..."
# Enable backquote key usage when keyboard input is set to Korean
mkdir -p ~/Library/KeyBindings
cp $DOTFILES/resources/DefaultkeyBinding.dict ~/Library/KeyBindings/

#-------------------------------------------------------------------------------
# Install Apps from AppStore with mas-cli
#-------------------------------------------------------------------------------

echo "🛒 Installing applications from App Store..."
mas install 937984704 # Amphetamine
mas install 497799835 # Xcode

echo "✅ Dotfiles setup complete!"
