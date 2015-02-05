#!/usr/bin/env bash
echo -e "Updating Formulas"
brew update;

echo -e "\nInstalling Formulas"

# install brew cask
brew install caskroom/cask/brew-cask

brew tap homebrew/versions

# for joe (gitignore tool) - http://karan.github.io/joe/
brew tap karan/karan 

# Formulas

brew install avrdude
brew install htop-osx
brew install httpie
brew install imagemagick
brew install gitignore # http://karan.github.io/joe/
brew install ncdu
brew install nmap
brew install socat
brew install the_silver_searcher 
brew install vim
brew install watch
brew install wget

# Casks

brew tap caskroom/versions
brew tap caskroom/unofficial
brew tap caskroom/fonts

# global apps
brew cask install --appdir="/Applications" dropbox

# user apps
#brew cask install boxer
brew cask install appcleaner
brew cask install base
brew cask install caffeine
brew cask install cakebrew
brew cask install chromecast
brew cask install charles
brew cask install color-oracle
brew cask install dash
brew cask install fantastical
brew cask install firefox
brew cask install genymotion
brew cask install google-chrome --appdir="/Applications"
brew cask install google-hangouts # hangouts support plugins
brew cask install gpgtools
brew cask install istat-menus
brew cask install iterm2
brew cask install eclipse-ide
brew cask install macvim
brew cask install mou
brew cask install nvalt
brew cask install opera
brew cask install sequel-pro-nightly
brew cask install sketchup
brew cask install slack
brew cask install sourcetree
brew cask install sublime-text3
brew cask install spotify
brew cask install spotify-notifications
brew cask install textwrangler
brew cask install vagrant
brew cask install xscope

brew cleanup --force

