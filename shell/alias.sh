####### system related #######
alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'

alias update='sudo apt update && sudo apt upgrade'
alias update='sudo dnf makecache && sudo dnf update'

alias myip='curl ifconfig.me'
alias chrome='`which google-chrome`'
alias open='gnome-open >/dev/null 2>&1'

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

alias ps='ps aux'
alias ff='find . -type f -name'
alias psg='ps|grep -v grep|grep -i -eVSZ -e'

####
alias tranz='trans :zh'
alias pc='proxychains4 -q'
alias yt='pc -q youtube-dl'
alias ppv='proxychains4 -q mpv'
alias rsync='rsync -Pz --rsh=ssh -6'
alias wget='wget -c --no-check-certificate'


alias bc='bc -l'
alias gp='gnuplot'
alias vi='vim'
alias ee='vim'
alias sha256='openssl sha1 -sha256'

#### git
alias gitp='git push origin master'
alias gita='git add -f --all * && git commit -a -m'

#### Python
alias py2='python2'
alias py3='python3'

alias ipy2='ipython2 --no-banner'
alias ipy3='ipython3 --no-banner'

command -v python3 >/dev/null && alias py='python3' || alias py='python2'
command -v ipython3 >/dev/null && alias ipy='ipython3 --no-banner' || alias ipy='ipython2 --no-banner'
alias pip2_update="sudo pip2 install -U \$(pip2 freeze|awk -F = '{print \$1}'|tr '\n' ' ') pip"
alias pip3_update="sudo pip3 install -U \$(pip3 freeze|awk -F = '{print \$1}'|tr '\n' ' ') pip"
####

