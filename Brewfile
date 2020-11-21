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
# Install Binaries
#-------------------------------------------------------------------------------

brew 'git'
brew 'node'
brew 'openssl'
brew 'pandoc'
brew 'wget'

#-------------------------------------------------------------------------------
# PHP
#-------------------------------------------------------------------------------

brew 'php73', args: ['without-apache']
brew 'composer'
brew 'phpunit'

#-------------------------------------------------------------------------------
# Ruby
#-------------------------------------------------------------------------------

brew 'ruby'
brew 'rbenv'

#-------------------------------------------------------------------------------
# Python (includes pip, easy_install)
#-------------------------------------------------------------------------------

brew 'python', args:['with-sphinx-doc']
brew 'python3', args:['with-sphinx-doc']
brew 'pyenv-virtualenv'

#-------------------------------------------------------------------------------
# Database
#-------------------------------------------------------------------------------

brew 'mysql'
brew 'sqlite'
brew 'mongodb'

#-------------------------------------------------------------------------------
# Apps
#-------------------------------------------------------------------------------

cask 'bestres'
cask 'calibre'
cask 'docker'
cask 'dropbox'
cask 'filezilla'
cask 'firefox'
cask 'google-chrome'
cask 'iterm2'
cask 'sequel-pro'
cask 'slack'
cask 'spectacle'

#-------------------------------------------------------------------------------
# Fonts
#-------------------------------------------------------------------------------

cask 'font-cascadia-code-pl'
