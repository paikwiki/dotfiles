#!/bin/sh

# Exit on error, undefined variables, and pipe failures
set -euo pipefail

#-------------------------------------------------------------------------------
# Dotfiles
#-------------------------------------------------------------------------------

# Set temporary variable
DOTFILES="$HOME/dotfiles"
CURRENT_DATE=$(date '+%Y%m%d-%H%M%S')
BACKUP_DIR="$HOME/dotfiles_backup_$CURRENT_DATE"

echo "📦 Setting up dotfiles..."
mkdir -p "$BACKUP_DIR"

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
ln -nfs "$DOTFILES/.zshrc" "$HOME/.zshrc"

#-------------------------------------------------------------------------------
# Homebrew
#-------------------------------------------------------------------------------

echo "🍺 Setting up Homebrew..."
PATH="/opt/homebrew/bin:$PATH"
if ! command -v brew > /dev/null 2>&1; then
  echo "Installing Homebrew..."
  if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "✓ Homebrew installed successfully"
  else
    echo "❌ Failed to install Homebrew. Please check your internet connection and try again."
    exit 1
  fi
else
  echo "✓ Homebrew is already installed"
fi

# Update Homebrew recipes
echo "Updating Homebrew recipes..."
if ! brew update; then
  echo "⚠️  Failed to update Homebrew, but continuing with installation..."
fi

# Install all our dependencies with bundle (See Brewfile)
echo "Installing Homebrew packages from Brewfile..."
if ! brew bundle --file="$DOTFILES/Brewfile"; then
  echo "❌ Failed to install some packages from Brewfile. Please check the errors above."
  exit 1
fi
brew cleanup

#-------------------------------------------------------------------------------
# Git Radar
#-------------------------------------------------------------------------------

echo "📡 Setting up git-radar..."
if ! command -v git-radar > /dev/null 2>&1; then
  echo "Installing git-radar..."
  # Install with tap (may show warnings but usually succeeds)
  if brew tap michaeldfallen/formula 2>&1 | grep -v "Warning" && \
     brew install git-radar 2>&1 | grep -v "Warning"; then
    echo "✓ git-radar installed successfully"
  else
    echo "⚠️  git-radar installation may have warnings, but continuing..."
  fi
else
  echo "✓ git-radar is already installed"
fi

#-------------------------------------------------------------------------------
# App Store Login Check
#-------------------------------------------------------------------------------

echo "🔐 Checking App Store login status..."
echo "⚠️  Please confirm you are signed in to the App Store."
echo "   This is required to install apps from the App Store."
echo "   Have you signed in to the App Store? (Y/n)"
read -r response
if [[ ! "$response" =~ ^[Yy]?$ ]]; then
  echo "Please sign in to the App Store first, then run this script again."
  exit 1
fi
echo "✓ App Store login confirmed"

#-------------------------------------------------------------------------------
# Git
#-------------------------------------------------------------------------------

echo "🌿 Setting up Git configuration..."
# Install global Git configuration
ln -nfs "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -nfs "$DOTFILES/.gitignore_global" "$HOME/.gitignore_global"

#-------------------------------------------------------------------------------
# Vim
#-------------------------------------------------------------------------------

echo "📝 Setting up Vim configuration..."
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo

# Install .vimrc
ln -nfs "$DOTFILES/.vimrc" "$HOME/.vimrc"

#-------------------------------------------------------------------------------
# Python - Pyenv
#-------------------------------------------------------------------------------

echo "🐍 Setting up Python environment..."
if command -v pyenv > /dev/null 2>&1; then
  if eval "$(pyenv init -)"; then
    echo "✓ Pyenv initialized successfully"
  else
    echo "⚠️  Pyenv initialization failed, but continuing..."
  fi
else
  echo "⚠️  Pyenv not found. It should have been installed via Brewfile."
fi

#-------------------------------------------------------------------------------
# Ruby - Rbenv
#-------------------------------------------------------------------------------

echo "💎 Setting up Ruby environment..."
if command -v rbenv > /dev/null 2>&1; then
  if eval "$(rbenv init -)"; then
    echo "✓ Rbenv initialized successfully"
  else
    echo "⚠️  Rbenv initialization failed, but continuing..."
  fi
else
  echo "⚠️  Rbenv not found. It should have been installed via Brewfile."
fi

#-------------------------------------------------------------------------------
# Node - NVM
#-------------------------------------------------------------------------------

echo "📦 Setting up Node environment..."
mkdir -p ~/.nvm

# Source NVM if available
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  source "/opt/homebrew/opt/nvm/nvm.sh"
  echo "✓ NVM initialized successfully"

  # Install Node LTS if not already installed
  if ! nvm ls --no-colors | grep -q "v[0-9]\+.*lts"; then
    echo "Installing Node.js LTS..."
    if nvm install --lts && nvm use --lts && nvm alias default 'lts/*'; then
      echo "✓ Node.js LTS installed successfully"
    else
      echo "❌ Failed to install Node.js LTS"
      exit 1
    fi
  else
    echo "✓ Node.js LTS is already installed"
    nvm use --lts
  fi
else
  echo "⚠️  NVM not found at /opt/homebrew/opt/nvm/nvm.sh"
  echo "   It should have been installed via Brewfile. Please check the installation."
fi

#-------------------------------------------------------------------------------
# Google Cloud SDK
#-------------------------------------------------------------------------------

echo "☁️ Setting up Google Cloud SDK..."
if ! command -v gcloud > /dev/null 2>&1; then
  if [ ! -d "$HOME/google-cloud-sdk" ]; then
    echo "Installing Google Cloud SDK to ~/google-cloud-sdk..."
    curl -fsSL https://sdk.cloud.google.com > /tmp/install.sh
    bash /tmp/install.sh --disable-prompts --install-dir="$HOME" || echo "⚠️  Google Cloud SDK installation failed, continuing..."
    rm -f /tmp/install.sh
    echo "ℹ️  Google Cloud SDK has been installed. Restart your terminal or source ~/.zshrc to use it."
  else
    echo "✓ Google Cloud SDK directory exists but not in PATH. Please restart your terminal or source ~/.zshrc."
  fi
else
  echo "✓ Google Cloud SDK is already installed"
fi

#-------------------------------------------------------------------------------
# Poetry
#-------------------------------------------------------------------------------

echo "📜 Setting up Poetry..."
# Install Poetry if not already installed
if ! command -v poetry > /dev/null 2>&1; then
  echo "Installing Poetry..."
  if curl -sSL https://install.python-poetry.org | python3 -; then
    echo "✓ Poetry installed successfully"
  else
    echo "⚠️  Poetry installation failed, but continuing..."
  fi
else
  echo "✓ Poetry is already installed"
fi

#-------------------------------------------------------------------------------
# uv
#-------------------------------------------------------------------------------

echo "⚡ Checking uv installation..."
if command -v uv > /dev/null 2>&1; then
  echo "✓ uv is installed"
else
  echo "⚠️  uv not found. It should have been installed via Brewfile."
fi

#-------------------------------------------------------------------------------
# Brightness
#-------------------------------------------------------------------------------

echo "💡 Setting up Brightness control..."
# Install brightness tool from source if not already installed
if ! command -v brightness > /dev/null 2>&1; then
  echo "Installing brightness..."
  if sh "$DOTFILES/scripts/install_brightness.sh"; then
    echo "✓ Brightness installed successfully"
  else
    echo "⚠️  Brightness installation failed, but continuing..."
  fi
else
  echo "✓ Brightness is already installed"
fi

#-------------------------------------------------------------------------------
# MacOS Preferences
#-------------------------------------------------------------------------------

echo "⌨️  Setting up macOS KeyBindings..."
# Enable backquote key usage when keyboard input is set to Korean
mkdir -p ~/Library/KeyBindings
cp "$DOTFILES/resources/DefaultkeyBinding.dict" ~/Library/KeyBindings/

#-------------------------------------------------------------------------------
# Install Apps from AppStore with mas-cli
#-------------------------------------------------------------------------------

echo "🛒 Installing applications from App Store..."
if mas install 937984704; then # Amphetamine
  echo "✓ Amphetamine installed successfully"
else
  echo "⚠️  Failed to install Amphetamine, but continuing..."
fi

# Xcode installation (requires user confirmation due to large size)
if ! mas list | grep -q "497799835"; then
  echo ""
  echo "⚠️  Xcode is a large application (12+ GB) and takes a long time to install."
  echo "   Do you want to install Xcode now? (y/N)"
  read -r response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Installing Xcode... This may take a while."
    if mas install 497799835; then
      echo "✓ Xcode installed successfully"
    else
      echo "❌ Failed to install Xcode. You can try again later with: mas install 497799835"
    fi
  else
    echo "Skipping Xcode installation. You can install it later with: mas install 497799835"
  fi
else
  echo "✓ Xcode is already installed"
fi

echo "✅ Dotfiles setup complete!"
