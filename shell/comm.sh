####################### common configuration #####################
# vim: ts=2 sw=2 ft=sh

#### system part
export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
# export XMODIFIERS=@im=fcitx

#### proxy
# export all_proxy=socks5://127.0.0.1:1080
if [[ $(pgrep privoxy) != "" ]]; then
## privoxy
	# export http_proxy=http://127.0.0.1:8080
	# export all_proxy=http://127.0.0.1:8080
	export all_proxy=http://127.0.0.1:8080
fi
## ss
# export socks_proxy=socks5://127.0.0.1:1080

if [[ -d $HOME/Workspace/rismom/analysis/python ]];then
	export PATH=$PATH:$HOME/Workspace/rismom/analysis/python
fi

export PATH=$HOME/.local/bin:$HOME/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/usr/lib:/usr/local/lib:/usr/local/lib64:$HOME/.local/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/usr/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$HOME/usr/include

#### gcc
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
alias gcc='gcc -fdiagnostics-color=always'
alias g++='g++ -fdiagnostics-color=always'

#### oh-my-zsh
if [[ $(basename $SHELL) == "zsh" &&  -f $HOME/.oh-my-zsh/README.md ]]; then
	plugin=( cp dnf git pip python rsync ssh-agent sudo systemd shell vim-interaction yum tmux thefuck npm node docker )
fi

#### PS1
if [[ $(basename $SHELL) == "bash" ]]; then
	export PS1="\[\033[1;32m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;35m\]\u@\h';fi)\[\033[1;32m\])\342\224\200(\[\033[1;31m\]\$?\[\033[1;32m\])\342\224\200(\[\033[1;36m\]\@ \d\[\033[1;32m\])\n\342\224\224[\[\033[1;33m\]\w\[\033[1;32m\]]\342\224\200\[\033[1;31m\]|> \[\033[0m\]"
fi

#### Bluetooth EarPod: MDR650BT
alias pau='pacmd set-card-profile bluez_card.00_18_09_A4_00_D0 a2dp_sink'

######## conky ##########
if [[ $(command -v conky) != "" && -x $HOME/usr/bin/conky.sh  && $(pgrep conky) = "" ]]; then
	$HOME/usr/bin/conky.sh >/dev/null 2>&1 &
fi
