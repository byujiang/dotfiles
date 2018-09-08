####### system related #######
####### vim: ts=4 sw=4 ft=sh

alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'

# command -v apt >/dev/null && export DNF='apt'
# command -v dnf >/dev/null && export DNF='dnf'
# [ -z $DNF ] || export DNF='yum'

if [[ $(command -v apt) != "" ]]; then
	function update(){
		sudo apt makecache && sudo apt update && sudo apt upgrade -y
		sudo apt list --installed | grep 'x86_64\|noarch\|i386\i486\i686'|awk '{print $1}' > /$HOME/Dropbox/System/Linux/Ubuntu/app.lst
	}
fi

if [[ $(command -v yum) != "" ]]; then
	function update(){
		command -v proxychains4 >/dev/null && proxy='proxychains4' || proxy=''
		sudo $proxy yum makecache && sudo $proxy yum update -y
		sudo $proxy yum list installed|awk '/(x86_64|i686|noarch)/ {print $1}' > $HOME/Dropbox/System/Linux/rpm.lst
	}
	alias app_count="sudo pc yum list installed |awk '/(x86_64|i686|noarch)/ {print \$1}'|wc -l"
fi

if [[ $(command -v dnf) != "" ]]; then
	function update(){
		command -v proxychains4 >/dev/null && proxy='proxychains4' || proxy=''
		sudo $proxy dnf makecache && sudo $proxy dnf update -y
		sudo $proxy dnf list installed|awk '/(x86_64|i686|noarch)/ {print $1}' > $HOME/Dropbox/System/Linux/rpm.lst
	}
	alias app_count="sudo pc dnf list installed |awk '/(x86_64|i686|noarch)/ {print \$1}'|wc -l"
fi

alias ipa="hostname -I"
alias wpa="watch -n1 'hostname -I'"
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
alias lsa='ls -lhA'

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
alias e.='nautilus . >/dev/null 2>&1 &'

#### network
alias v6='ping -c 4 -6 amito.me'
#### grep ####
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ps='ps aux'
alias ff='find . -type f -name'
alias psg='ps|grep -v grep|grep -i -e " PID " -e VSZ -e'

####
alias tran='trans :zh'
[[ ! -x /usr/bin/pc ]] && alias pc='proxychains4 -q'
alias yt='pc -q youtube-dl'
alias ppv='proxychains4 -q mpv'
alias rsync='rsync -Pz --rsh=ssh -6'
alias wget='wget --no-proxy -c --no-check-certificate'

alias bc='bc -l'
alias gp='gnuplot'
alias vi='vim'
alias ee='vim'
# alias :q='tput setaf 1;echo >&2 "This is not Vi(m) \::/"; tput sgr0'
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
alias pip2_update="sudo pc pip2 install \$(sudo pc pip2 list --no-cache-dir --outdated --format=columns|tail -n +3|cut -d ' ' -f1)"
alias pip3_update="sudo pc pip3 install \$(sudo pc pip3 list --no-cache-dir --outdated --format=columns|tail -n +3|cut -d ' ' -f1)"
####


####
command -v evince >/dev/null 2>&1 && alias acroread='evince'
command -v okular >/dev/null 2>&1 && alias acroread='okular'

#### Terminology
command -v tycat >/dev/null 2>&1 && alias catimg='tycat -g 192x108 '

#### SBATCH
command -v squeue >/dev/null 2>&1 && alias qs='squeue -u $(whoami)' && alias sq='qs'


#### hexo
# if [[ $(command -v hexo) != "" ]]; then
	# alias hc='hexo clean'
	# alias hg='hexo generate'
	# alias hs='hexo server'
# fi
alias hc="hexo clean"
alias hs="hexo server"
alias hd="hexo clean && hexo deploy"

###dnf
alias di='sudo dnf install -6y'
alias di6='sudo dnf install -6y'
alias di4='sudo dnf install -4y'
#### applications
# alias netmusic="all_proxy=socks://127.0.0.1:1080 /usr/bin/netease-cloud-music %U >/dev/null 2>&1 &"
alias caps="gsettings set org.gnome.desktop.input-sources xkb-options \"['caps:ctrl_modifier']\""
alias dark="gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'"
alias pale="gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'"

#### simple functions
# keep journal
# alias jj='mkdir -p $HOME/Dropbox/Workspace/journal/$(date +%Y)/$(date +%m); test -f /usr/bin/code && edit="code" || edit="vim"; $edit "$HOME/Dropbox/Workspace/journal/$(date +%Y)/$(date +%m)/journal-$(date +%Y-%m-%d).md"'
# alias todo='mkdir -p $HOME/Dropbox/Workspace/todo/$(date +%Y); vim $HOME/Dropbox/Workspace/todo/$(date +%Y)/todo-$(date +%Y-%m).md'


####
alias make_grub2='sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg'
