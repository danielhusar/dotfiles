#!/bin/bash

# Install Xcode Command-Line Tools
if ! xcode-select -p ; then
  xcode-select --install
  exit 0
fi

# Install homebrew
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install dependencies
brew tap homebrew/bundle
brew bundle

# Reset quicklook
qlmanage -r

# Remove outdated versions from the cellar
brew cleanup

# Node
sudo npm install --global trash-cli
sudo npm install --global yo
sudo npm install --global vtop
sudo npm install --global generator-simple-node-package

# Oh my zsh
sh4 -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install dotfiles
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "Brewfile" \
  --exclude "README.md" --exclude "com.googlecode.iterm2.plist" --exclude "install.sh" \
  --exclude "dotfiles.sublime-project" --exclude "dotfiles.sublime-workspace" -av --no-perms . ~

# Fix permissions
sudo chown -R $(whoami) ~/.npm

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

source ~/.zshrc
