#!/usr/bin/env bash
echo -e "Updating Formulas"
brew update;

echo -e "\nInstalling Formulas"

brew tap homebrew/versions
brew tap homebrew/binary
brew tap domt4/autoupdate
brew tap go-swagger/go-swagger

# for joe (gitignore tool) - http://karan.github.io/joe/
brew tap karan/karan

# Formulas

brew install avrdude
brew install htop-osx
brew install httpie
brew install imagemagick
brew install gitignore # http://karan.github.io/joe/
brew install jq
brew install jsdoc3
brew install ncdu
brew install nmap
brew install pyenv
brew install safe-rm
brew install socat
brew install the_silver_searcher
brew install vim
brew install watch
brew install wget

# Casks

brew tap caskroom/versions
brew tap caskroom/unofficial
brew tap caskroom/fonts

# user apps
brew cask install 1password
brew cask install bartender
brew cask install base
brew cask install caffeine
brew cask install cakebrew
brew cask install chromecast
brew cask install charles
#brew cask install color-oracle
brew cask install dash
brew cask install dropbox
brew cask install dnscrypt
brew cask install firefox
brew cask install genymotion
brew cask install google-chrome --appdir="/Applications"
brew cask install google-hangouts # hangouts support plugins
brew cask install hex-fiend
brew cask install hyperdock
brew cask install istat-menus
brew cask install iterm2
brew cask install sequel-pro-nightly
brew cask install slack
brew cask install sourcetree
brew cask install spotify
brew cask install virtualbox
#brew cask install textwrangler
brew cask install vagrant
brew cask install visual-studio-code
brew cask install wmail
#brew cask install xscope

brew cask install font-droid-sans-mono-for-powerline

brew cleanup --force

