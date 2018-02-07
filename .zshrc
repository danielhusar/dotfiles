# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="prose"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(brew git git-extras github node npm rails)

source $ZSH/oh-my-zsh.sh
unsetopt correct

# PATH
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/bin:$PATH
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/.rbenv/bin:$PATH
export PATH=~/.rbenv/shims:$PATH
export PATH=$HOME/.pilot/bin:$PATH
export PATH=$HOME/bin:$PATH

for file in ~/.{extra,exports,aliases,functions,env}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Custom scripts
. ~/.scripts/z.sh
. ~/.scripts/k.sh

export INTERCOM_USER="daniel.husar"
export BILLING_SERVICE_AVAILABLE=true

eval $(pilot env)

# Auto change node version
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
source $(which assume-role)
export AWS_DEFAULT_REGION="us-east-1"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export GPG_TTY=$(tty)
