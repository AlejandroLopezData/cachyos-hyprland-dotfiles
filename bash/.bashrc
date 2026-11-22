#
# ~/.bashrc
#

# If not running interactively, do nothing
[[ $- != *i* ]] && return

# fastfetch: pick the logo size depending on the terminal width
ff() {
  local cols
  cols=$(tput cols 2>/dev/null || echo 80)
  if   [ "$cols" -ge 102 ]; then fastfetch
  elif [ "$cols" -ge 80 ];  then fastfetch --logo arch_small
  elif [ "$cols" -ge 60 ];  then fastfetch --logo none
  fi
}
ff

# ble.sh: grey history-based suggestions + syntax highlighting.
# Loaded first, attached at the very end of this file.
source /usr/share/blesh/ble.sh --attach=none
[[ ${BLE_VERSION-} ]] && bleopt complete_auto_complete=1
[[ ${BLE_VERSION-} ]] && ble-bind -m emacs -f C-m accept-line

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

export PATH="$HOME/.local/bin:$PATH"

# Personal config that is not tracked in this repo
[ -f "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

# ble.sh must attach last, after prompt, aliases and completions are set up.
[[ ${BLE_VERSION-} ]] && ble-attach
