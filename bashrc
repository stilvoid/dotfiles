# Check for an interactive session
[ -z "$PS1" ] && return

[ -z "$TMUX" ] && exec ~/bin/tmux

# Colourful things
alias ls='ls --color=auto -p'
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias cat="bat -p"

export LS_COLORS='di=96'
 
ps1_prompt="\u> "
. ~/code/github.com/stilvoid/ps1/ps1.sh

export TERMINAL=/usr/bin/xterm
export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/vim

export LC_TIME=en_GB.UTF-8

#setterm -blength 0
set -o vi
shopt -s checkwinsize
stty stop undef
stty start undef

# Go
export GOPATH=~/.gohome
export PATH+=:$GOPATH/bin

# Node
export PATH+=:$HOME/.node/bin
export NODE_PATH=$HOME/.node/lib/node_modules:$NODE_PATH

# Ruby
export GEM_HOME="$HOME/.gem"
export PATH+=:$GEM_HOME/ruby/2.5.0/bin
export PATH+=:$GEM_HOME/ruby/2.6.0/bin

# Personal binaries
export PATH+=:~/bin

# ls after a cd
function cl {
    if [ -z "$PS1" ]; then
        cd "$@"
    else
        cd "$@" && ls && echo
    fi
}
alias cd=cl

eval "$(fasd --init auto)"

source ~/bin/git-cube

# Start ssh-agent
#eval $(keychain --quiet --eval id_rsa 2>/dev/null)
