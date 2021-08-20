#
# see /etc/profile.local


test -e /etc/profile.local && . /etc/profile.local

alias foliendvi="xdvi -paper a4r -s 9 -geometry -0+50"

alias emacs="\emacs --no-splash -geometry 100x54+80-0"

alias qrencode="qrencode -t ANSIUTF8"


############### make a pretty promt

if [ "`id -u`" -eq 0 ]; then
    PS1="\[\033[m\]|\[\033[1;35m\]\A\[\033[m\]|\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
else
    PS1="\[\033[m\]|\[\033[1;35m\]\A\[\033[m\]|\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
fi

###############

function pskill {
        local pid
        pid=$(ps ax | grep $1 | grep -v grep | awk '{ print $1 }')
        echo -n "killing $1 (process $pid)..."
        kill -1 $pid
        echo "slaughtered."
}

function pskillForce {
        local pid
        pid=$(ps ax | grep $1 | grep -v grep | awk '{ print $1 }')
        echo -n "killing $1 (process $pid)..."
        kill -9 $pid
        echo "slaughtered."
}


alias a='alias'
alias ls='ls -F'
alias la='ls -AF'
alias ll='ls -AlF'
alias less='/usr/bin/less -M'
alias m='less'
alias h='history'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -kh'
alias du='du -k'
alias ssh='ssh -oForwardX11=yes'
