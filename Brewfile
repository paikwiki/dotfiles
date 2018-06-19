#-------------------------------------------------------------------------------
# Thanks to Appkr! https://github.com/appkr/dotfiles/blob/master/Brewfile
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Taps
#-------------------------------------------------------------------------------

tap 'caskroom/cask'
tap 'caskroom/fonts'
tap 'caskroom/versions'
tap 'Homebrew/bundle'
tap 'homebrew/dupes'
tap 'homebrew/php'
tap 'homebrew/services'
tap 'homebrew/versions'

#-------------------------------------------------------------------------------
# Make sure apps get installed in system Applications dir
#-------------------------------------------------------------------------------

cask_args appdir: '/Applications'

#-------------------------------------------------------------------------------
# Install Bash 4
#-------------------------------------------------------------------------------

brew 'bash'

#-------------------------------------------------------------------------------
# Install Binaries
#-------------------------------------------------------------------------------

brew 'awscli'
brew 'git'
brew 'mackup'
brew 'node'
brew 'openssl'
brew 'pandoc'
brew 'wget'

#-------------------------------------------------------------------------------
# Development-PHP
# @see $ brew info php71, which reads...
# With the release of macOS Sierra the Apache module is now not built by default.
# If you want to build it on your system you have to install php with the
# --with-httpd24 option. See  brew options php71  for more details.
#-------------------------------------------------------------------------------

brew 'php72', args: ['without-apache']
brew 'composer'
brew 'phpunit'

#-------------------------------------------------------------------------------
# Development-Ruby
#-------------------------------------------------------------------------------

brew 'ruby'
brew 'rbenv'

#-------------------------------------------------------------------------------
# Development-Python (includes pip, easy_install)
#-------------------------------------------------------------------------------

brew 'python', args:['with-sphinx-doc']
brew 'python3', args:['with-sphinx-doc']
brew 'pyenv-virtualenv'

#-------------------------------------------------------------------------------
# Development-Database
#-------------------------------------------------------------------------------

brew 'mysql'
brew 'sqlite'
brew 'mongodb'

#-------------------------------------------------------------------------------
# Apps
#-------------------------------------------------------------------------------

cask 'atom'
cask 'bestres'
cask 'calibre'
cask 'docker'
cask 'dropbox'
cask 'evernote'
cask 'filezilla'
cask 'firefox'
cask 'google-chrome'
cask 'google-drive'
cask 'intellij-idea'
cask 'iterm2'
cask 'keycastr'
cask 'phpstorm'
cask 'sequel-pro'
cask 'slack'
cask 'spectacle'
cask 'spotify'
cask 'tunnelbear'

#-------------------------------------------------------------------------------
# Fonts
#-------------------------------------------------------------------------------

cask 'font-space-mono'

