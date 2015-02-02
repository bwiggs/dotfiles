#!/usr/bin/env bash
echo -e "Updating Formulas"
brew update;

echo -e "\nInstalling Formulas"

# install brew cask
brew install caskroom/cask/brew-cask

brew tap homebrew/versions
brew tap caskroom/versions
brew tap caskroom/fonts

# Formulas

brew install avrdude
brew install htop-osx
brew install httpie
brew install imagemagick
brew install ncdu
brew install nmap
brew install socat
brew install the_silver_searcher 
brew install vim
brew install watch
brew install wget

# Casks
# global apps
brew cask install --appdir="/Applications" dropbox

# user apps
#brew cask install boxer
brew cask install cakebrew
brew cask install chromecast
brew cask install charles
brew cask install color-oracle
brew cask install firefox
brew cask install google-chrome
brew cask install google-hangouts # hangouts support plugins
brew cask install iterm2
brew cask install eclipse-ide
brew cask install macvim
brew cask install opera
brew cask install sketchup
brew cask install sourcetree
brew cask install spotify
brew cask install spotify-notifications
brew cask install vagrant

brew cleanup --force

