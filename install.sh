#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Reset quicklook
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

# Oh my zsh
sh4 -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
