#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!' # Read man pages in nvim
export PATH="$HOME/.local/bin:$PATH"

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec wrappedhl
fi
