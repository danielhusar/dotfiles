#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
	--exclude "README.md" --exclude "com.googlecode.iterm2.plist" --exclude "install.sh" \
	--exclude "dotfiles.sublime-project" --exclude "dotfiles.sublime-workspace" -av --no-perms . ~
source ~/.zshrc

