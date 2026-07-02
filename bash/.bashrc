#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# cd to directory with name only. Shopt -u autocd to turn off.
shopt -s autocd

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

alias mpv="mpv --hwdec=auto"
alias resolv_reset="sudo chattr -i /etc/nordvpn/resolv.conf"
alias logout="loginctl terminate-user $USER"
alias dirs='dirs -v'
alias ls='ls --color=auto'
alias ll='ls --color=auto -lah'
alias grep='grep --color=auto'
alias ..='cd ..'
alias cl='clear'
alias nv=nvim
alias vn=nvim
alias vim=nvim
alias so=source
alias remove_orphans='sudo pacman -Rns $(pacman -Qdtq)'
alias nord=nordvpn
alias nordob='nordvpn set technology openvpn && nordvpn set obfuscate enabled && nordvpn connect' 
alias nordlynx='nordvpn set technology nordlynx && nordvpn connect' 
alias nordwhisper='nordvpn set technology nordwhisper && nordvpn connect' 
alias ns='nordvpn status' 
alias nordc='nordvpn c'
alias gs='git status'

alias wific='nmcli device wifi connect' 
alias wifid='nmcli connection delete' 

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
  cd ~
  file=$(fzf --query "$1") || return
  [ -f "$file" ] || return
  dir=$(dirname "$file")
  cd "$dir" || return
  nvim "$(basename "$file")"
}

# Find a file and open it with the appropriate program
open() {
    local file
    file=$(find . -type f | fzf --query $1) || return
    xdg-open "$file" >/dev/null 2>&1 &
}

# Make a directory and cd there
# mkcd(){ mkdir "$1" && cd "$1" ; }
mkcd() { mkdir -p "$1" && cd "$1"; }

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

# Open yazi with y, change pwd to yazi directory
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

PS1='[\u@\h \W]\$ '
PS1='[\W]\$ '
PS1='[\w]\n\$ '
