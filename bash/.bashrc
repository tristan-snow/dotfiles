#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias dirs='dirs -v'
alias ls='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls --color=auto -lah'
alias grep='grep --color=auto'
alias ..='cd ..'
alias cl='clear'
alias nv=nvim
alias vn=nvim
alias vim=nvim
alias sp='sudo pacman -S '
alias remove_orphans='pacman -Rns $(pacman -Qdtq)'

export VIMKEYS="$HOME/.config/nvim/lua/tristan/core/keymaps.lua"
export VIMOPTS="$HOME/.config/nvim/lua/tristan/core/options.lua"

alias nvk='nvim $VIMKEYS'
alias nvo='nvim $VIMOPTS'

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Function to edit with nvim with permissions
snv(){
    sudo -E nvim "$1"
}

# Function to clear the directory stack
popall(){ cd ~ && while popd > /dev/null; do :; done }

# Function to fuzzily find file and open with nvim
nf() { fzf --query "$1" | xargs -r nvim; }

# Function to fuzzily find directory, move there, add the current directory to the stack, and show the stack
sd() {
  pushd ~ > /dev/null
  cd "$(find . -type d | fzf --query "$1")"
  dirs -v
}

PS1='[\u@\h \W]\$ '
