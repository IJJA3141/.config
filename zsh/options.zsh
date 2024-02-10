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

zmodload zsh/zle
zmodload zsh/zpty
zmodload zsh/complist

autoload _vi_search_fix
autoload -Uz colors
autoload -U compinit
colors

zle -N _vi_search_fix
zle -N _sudo_command_line

# Completion
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Autosuggestion
ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$color8,bold"

while read -r opt
do
    setopt $opt
done <<-EOF
AUTOCD
AUTO_MENU
AUTO_PARAM_SLASH
COMPLETE_IN_WORD
NO_MENU_COMPLETE
HASH_LIST_ALL
ALWAYS_TO_END
NOTIFY
NOHUP
MAILWARN
INTERACTIVE_COMMENTS
NOBEEP
APPEND_HISTORY
SHARE_HISTORY
INC_APPEND_HISTORY
EXTENDED_HISTORY
HIST_IGNORE_ALL_DUPS
HIST_IGNORE_SPACE
HIST_NO_FUNCTIONS
HIST_EXPIRE_DUPS_FIRST
HIST_SAVE_NO_DUPS
HIST_REDUCE_BLANKS
EOF

while read -r opt
do
    unsetopt $opt
done <<-EOF
FLOWCONTROL
NOMATCH
CORRECT
EQUALS
EOF
