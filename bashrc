# Check for an interactive session
[ -z "$PS1" ] && return

[ -z "$TMUX" ] && exec ~/bin/tmux

# Colourful things
alias ls='ls --color=auto -p'
alias diff="diff --color=auto"
alias grep="grep --color=auto"

export LS_COLORS='di=96'
 
ps1_prompt="\u> "
. ~/code/github.com/stilvoid/ps1/ps1.sh

export TERMINAL=/usr/bin/xterm
export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/vim

export LC_TIME=en_GB.UTF-8

#setterm -blength 0

set -o vi

# Go
export GOPATH=~/.gohome
export PATH+=:$GOPATH/bin

# Ruby
export GEM_HOME=$HOME/gems
export PATH=$PATH:$GEM_HOME/bin
export PATH=$PATH:~/.gem/ruby/2.5.0/bin

stty stop undef
stty start undef

# ls after a cd
function cl {
    if [ -z "$PS1" ]; then
        cd "$@"
    else
        cd "$@" && ls && echo
    fi
}
alias cd=cl

# Start ssh-agent
eval $(keychain -Q --quiet --eval id_rsa F3C186D1 2>/dev/null)
export GPG_AGENT_INFO=~/.gnupg/S.gpg-agent:$(pidof gpg-agent):1

export PATH+=:~/bin

shopt -s checkwinsize

eval "$(fasd --init auto)"
