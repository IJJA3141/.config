# cd
setopt autocd

### Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#   Include hidden files.
_comp_options+=(globdots)
