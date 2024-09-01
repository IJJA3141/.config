alias aliaslist="cat ~/.config/zsh/alias.zsh"
alias keybinds="cat ~/.config/hypr/input.conf"
alias wifi="zsh ~/.config/scripts/fuckwifi.sh"
alias ssh="kitten ssh"

alias lsa="ls -vahl --color=auto --group-directories-first"
alias ls="ls --color=auto"
alias gr="git rm . --cached -rf >> /dev/null"
alias ga="git add . && git commit -m \'$1\' && git push"
alias untar="tar -xvf"
alias ungz="tar -xzvf"

function gl ()
{
    logs="$(git log | grep '[0-99]\.[0-99]')"

    for ((i = "$(echo $logs | wc -l)"; i > 0; i--)); do
        echo $logs | sed "${i}q;d"
    done
}
alias gl=gl

function lc ()
{
    l=$(sed -e 's/\x1b\[[0-9;]*m//g' $1 | wc -l)
    c=$(sed -e 's/\x1b\[[0-9;]*m//g' $1 | wc -L)

    echo "line: ${l}\ncolomn: ${c}"
}
alias lc=lc

function forallfiles()
{
    files=($(find ./ -exec ls -d $PWD/{} \;))

    for ((i = 2 ; i <= ${#files[@]} ; i++ )); do
        echo "$1 $files[i]"
        eval "$1 $files[i]"
    done
}
alias forfiles=forallfiles
