# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="prose"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(bower brew git git-extras github node npm rails)

source $ZSH/oh-my-zsh.sh
unsetopt correct

# PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/bin:$PATH
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

for file in ~/.{extra,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add nvm
source $(brew --prefix nvm)/nvm.sh

# Custom scripts
. ~/.scripts/z.sh
. ~/.scripts/k.sh
