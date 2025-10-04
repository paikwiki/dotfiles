#!/bin/sh

#-------------------------------------------------------------------------------
# Install brightness - macOS display brightness control tool
# License: BSD-2-Clause
# Source: https://github.com/nriley/brightness
#-------------------------------------------------------------------------------

echo "💡 Installing brightness tool..."

# Create temporary directory
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

# Clone repository
if ! git clone --depth 1 https://github.com/nriley/brightness.git "$TEMP_DIR/brightness"; then
  echo "❌ Failed to clone brightness repository"
  exit 1
fi

# Build
cd "$TEMP_DIR/brightness"
if ! make; then
  echo "❌ Failed to build brightness"
  exit 1
fi

# Install to /usr/local/bin
echo "Installing brightness to /usr/local/bin (requires sudo)..."
sudo mkdir -p /usr/local/bin
sudo install -m 0755 brightness /usr/local/bin/brightness

if [ -f "/usr/local/bin/brightness" ]; then
  echo "✅ brightness installed successfully"
else
  echo "❌ Failed to install brightness"
  exit 1
fi
