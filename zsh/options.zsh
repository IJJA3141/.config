# cd
setopt autocd
setopt extendedglob
unsetopt beep

### Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#   Include hidden files.
_comp_options+=(globdots)
