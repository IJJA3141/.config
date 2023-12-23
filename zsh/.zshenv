typeset -U PATH path 

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

export EDITOR="nvim"
export VISUAL="nvim"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000 
