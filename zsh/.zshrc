### Style
##  Enable colors and change prompt:
autoload -U colors && colors

eval "$(oh-my-posh init zsh --config /usr/share/oh-my-posh/themes/hul10.omp.json)"
##  Nice themes
#   takuya
#   tiwahu
#   hul10
#   gruvbox

### Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#   Include hidden files.
_comp_options+=(globdots)

#   Nvim mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

### History
HISTSIZE=10000
SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# cd
setopt autocd

eval "$(dircolors ~/.config/zsh/.dir_colors)"

source ~/.config/zsh/alias.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting.zsh
