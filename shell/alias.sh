########## common config #########
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export EDITOR=vim
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/usr/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/usr/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$HOME/usr/include
export PATH=$HOME/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/Workspace/rismom/analysis/pyhton

####### system related #######
alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'

command -v apt && alias update='sudo apt update && sudo apt upgrade'
command -v dnf && alias update='sudo dnf makecache && sudo dnf update'
command -v pip2 && alias pip2_update="sudo pip install -U ($(pip freeze|awk -F = '{print $1}'|tr '\n' ' ')) pip"
command -v pip3 && alias pip3_update="sudo pip3 install -U ($(pip freeze|awk -F = '{print $1}'|tr '\n' ' ')) pip"

#######
alias c='clear'
alias e='exit'

alias ls='ls --color=auto'
alias l='ls'
alias sl='ls'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lhA'

alias rd='rmdir'
alias md='mkdir -pv'
alias rm='rm -i'
alias mr='rm -i'
alias del='rm'

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

#### grep ####
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias tranz='trans :zh'
alias pc='proxychains4 -q'
alias yt='pc -q youtube-dl'
alias ppv='proxychains4 -q mpv'
alias rsync='rsync -Pz --rsh=ssh -6'
alias wget='wget -c --no-check-certificate'

command -v bc  && alias bc='bc -l'
command -v gnuplot && alias gp='gnuplot'
command -v vim && alias vi='vim' && alias ee='vim'
command -v openssl && alias sha256='openssl sha1 -sha256'

#### git
alias gitp='git push origin master'
alias gita='git add -f --all * && git commit -a -m'
