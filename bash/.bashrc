#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# cd to directory with name only. Shopt -u autocd to turn off.
shopt -s autocd

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

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
alias so=source
alias remove_orphans='pacman -Rns $(pacman -Qdtq)'

export VIMKEYS="$HOME/.config/nvim/lua/core/keymaps.lua"
export VIMOPTS="$HOME/.config/nvim/lua/core/options.lua"

alias nvk='nvim $VIMKEYS'
alias nvo='nvim $VIMOPTS'
alias nvb='nvim ~/.bashrc && source ~/.bashrc'

# Map p to pushd for faster directory stack transit
p() { pushd "+$1"; }

# Edit with nvim with permissions
snv() { sudo -E nvim "$1"; }

# Clear the directory stack
popall(){ cd ~ && while popd > /dev/null; do :; done }

# Fuzzily find file, move to its directory and open with nvim
nf() {
  file=$(fzf --query "$1") || return
  [ -f "$file" ] || return
  dir=$(dirname "$file")
  cd "$dir" || return
  nvim "$(basename "$file")"
}

# Fuzzily find file and open it with nvim (stay in pwd)
nfs() { fzf --query "$1" | xargs -r nvim; }

# Fuzzily find and push to dir, show the dir stack
sdp() {
  pushd ~ > /dev/null # > /dev/null silences the output
  cd "$(find . -type d | fzf --query "$1")"
  dirs -v
}

# Fuzzily find and move to dir
sd() {
  cd ~ 
  cd "$(find . -type d | fzf --query "$1")"
}

hw() { echo "Hello World"; }

PS1='[\u@\h \W]\$ '
PS1='[\W]\$ '
PS1='[\w]\n\$ '
