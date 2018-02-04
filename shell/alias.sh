####### system related #######
alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'

if [[ $(command -v apt) != "" ]]; then
	function update(){
		sudo apt makecache && sudo apt update && sudo apt upgrade -y
		sudo apt list --installed | grep 'x86_64\|noarch\|i386\i486\i686'|awk '{print $1}' > /$HOME/Dropbox/System/Linux/Ubuntu/app.lst
	}
fi

if [[ $(command -v yum) != "" ]]; then
	function update(){
		command -v dnf >/dev/null && up='dnf' || up='yum'
		sudo $up makecache && sudo $up update -y
		sudo $up list installed |grep 'x86_64\|noarch\|i686'|awk '{print $1}' > $HOME/Dropbox/Linux/Fedora/rpm.lst
	}
fi

# alias myip='echo $(wget --no-proxy -O - -q ident.me)'
alias myip='echo $(wget -O - -q ident.me)'
# alias myip1='curl ifconfig.me ifconfig.me'
alias myip1='curl ifconfig.me ifconfig.me'
alias myip2='curl icanhazip.com icanhazip.com'
alias myip3='curl myip.ipip.net myip.ipip.net -s --stderr - |sed -ne "s/^.*：\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\).*$/\1/p"'
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
alias e.='gnome-open . >/dev/null 2>&1'

#### grep ####
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ps='ps aux'
alias ff='find . -type f -name'
alias psg='ps|grep -v grep|grep -i -e " PID " -e VSZ -e'

####
alias tranz='trans :zh'
alias pc='proxychains4 -q'
alias yt='pc -q youtube-dl'
alias ppv='proxychains4 -q mpv'
alias rsync='rsync -Pz --rsh=ssh -6'
alias wget='wget --no-proxy -c --no-check-certificate'

alias bc='bc -l'
alias gp='gnuplot'
alias vi='vim'
alias ee='vim'
alias sha256='openssl sha1 -sha256'

#### git
alias gitp='git push origin master'
alias gita='git add -f --all * && git commit -am'

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


####
command -v evince >/dev/null 2>&1 && alias acroread='evince'
command -v okular >/dev/null 2>&1 && alias acroread='okular'
