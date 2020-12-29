#===============================================================================
#                 ____                     __                         
#           _____/ __/________ _____  ____/ /__  ______________  ____ 
#          / ___/ /_/ ___/ __ `/ __ \/ __  / _ \/ ___/ ___/ __ \/ __ \
#         / /__/ __(__  ) /_/ / / / / /_/ /  __/ /  (__  ) /_/ / / / /
#         \___/_/ /____/\__,_/_/ /_/\__,_/\___/_/  /____/\____/_/ /_/ 
#                                                                     
#                                    __             
#                        ____  _____/ /_  __________
#                       /_  / / ___/ __ \/ ___/ ___/
#                        / /_(__  ) / / / /  / /__  
#                       /___/____/_/ /_/_/   \___/  
#                       
#===============================================================================

# Aliases moved to ~/.oh-my-zsh/custom/aliases.zsh and accessible with "alius" alias.

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export AWS_PROFILE=chaos
export ZSH=$HOME/.oh-my-zsh
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:$PATH
export DOCKER_PG=1

ZSH_THEME="agnoster"

HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/history

ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(
    git 
    npm 
    osx 
    vi-mode 
    web-search 
    zsh-completions
    zsh-syntax-highlighting
)

# source $HOME/.bash_profile
source $ZSH/oh-my-zsh.sh

export SSH_KEY_PATH="~/.ssh/id_rsa"


. $(brew --prefix asdf)/asdf.sh
# . /usr/local/opt/asdf/asdf.sh
# . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

export PATH="/usr/local/sbin:$PATH"
