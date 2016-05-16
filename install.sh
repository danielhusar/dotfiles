#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Taps
brew tap homebrew/dupes
brew tap phinze/homebrew-cask
brew tap josegonzalez/homebrew-php

# Cli
brew install coreutils
brew install findutils
brew install ack
brew install bash
brew install brew-cask
brew install ffmpeg
brew install gifsicle
brew install git
brew install git-extras
brew install homebrew/dupes/grep
brew install hub
brew install imagemagick
brew install node
brew install nvm
brew install ntfs-3g
brew install phantomjs
brew install rbenv
brew install ruby-build
brew install rename
brew install tree
brew install youtube-dl
brew install wget --enable-iri

# Programs
brew cask install 1password
brew cask install aerial
brew cask install airmail-amt
brew cask install alfred
brew cask install atom
brew cask install catch
brew cask install dropbox
brew cask install firefox
brew cask install flash-player
brew cask install gitter
brew cask install google-chrome
brew cask install iterm2
brew cask install imageoptim
brew cask install img2icns
brew cask install karabiner
brew cask install lastfm
brew cask install licecap
brew cask install limechat
brew cask install litecoin
brew cask install mailbox
brew cask install mou
brew cask install openoffice
brew cask install opera
brew cask install perian
brew cask install skype
brew cask install slack
brew cask install sourcetree
brew cask install smoothmouse
brew cask install steam
brew cask install subtitles
brew cask install teamspeak-client
brew cask install transmit
brew cask install utorrent
brew cask install virtualbox
brew cask install vlc
brew cask install xtrafinder

# Quick view plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install webp-quicklook
brew cask install suspicious-package
brew cask install qlimagesize
qlmanage -r

# Remove outdated versions from the cellar
brew cleanup

# Node
sudo npm install --global trash-cli
sudo npm install --global yo
sudo npm install --global vtop
sudo npm install --global generator-simple-node-package

# Fix permissions
sudo chown -R $(whoami) ~/.npm

# Install pow
curl get.pow.cx | sh

# Bundler
sudo gem install bundler
sudo gem install powder

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
