alias aliaslist="cat ~/.config/zsh/alias.zsh"

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
