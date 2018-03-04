####################### common configuration #####################
#### vim: ts=4 sw=4 ft=sh

#### system part
export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

#### proxy
# export all_proxy=socks5://127.0.0.1:1080
# export http_proxy=socks5://127.0.0.1:1080
# export https_proxy=socks5://127.0.0.1:1080
# export socks_proxy=socks5://127.0.0.1:1080

if [[ -d $HOME/Workspace/rismom/analysis/python ]];then
	export PATH=$PATH:$HOME/Workspace/rismom/analysis/python
fi

export PATH=$HOME/usr/bin:$HOME/usr/scripts:/usr/local/bin:/usr/local/sbin:$PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/usr/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/usr/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$HOME/usr/include

#### gcc
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
alias gcc='gcc -fdiagnostics-color=always -std=c11'
alias g++='g++ -fdiagnostics-color=always -std=c++11'

#### oh-my-zsh
if [[ $(basename $SHELL) == "zsh" &&  -f $HOME/.oh-my-zsh/README.md ]]; then
	# ZSH_THEME="bureau"
	plugin=( cp dnf git pip python rsync ssh-agent sudo systemd shell vim-interaction )
fi

#### PS1
if [[ $(basename $SHELL) == "bash" ]]; then
	PS1="\[\033[1;32m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;35m\]\u@\h';fi)\[\033[1;32m\])\342\224\200(\[\033[1;31m\]\$?\[\033[1;32m\])\342\224\200(\[\033[1;36m\]\@ \d\[\033[1;32m\])\n\342\224\224[\[\033[1;33m\]\w\[\033[1;32m\]]\342\224\200\[\033[1;31m\]|> \[\033[0m\]"
fi

#if [[ $(basename $SHELL) == "zsh" ]]; then
# export PROMPT="%{%}%B┌─[%b%{%}%{%}%n%{%}@%{%}%{%}%m%{%}%B]%b%{%} - %b%{%}%B[%b%{%}%~%{%}%B]%b%{%} - %{%}%B[%b%{%}%D{%a %b %d, %H:%M}%b%{%}%B]%b%{%}
# %{%}%B└─%B[%{%}$%{%}%B] - %B[\$?%B] - <$(git_prompt_info)>%{%}%b"
# PS1='%{%}%B┌─[%b%{%}%{%}%n%{%}@%{%}%{%}%m%{%}%B]%b%{%} - %b%{%}%B[%b%{%}%~%{%}%B]%b%{%} - %{%}%B[%b%{%}%D{%a %b %d, %H:%M}%b%{%}%B]%b%{%}
# %{%}%B└─%B[%{%}$%{%}%B] <$(git_prompt_info)>%{%}kb'
#fi
#### Bluetooth EarPod: MDR650BT
alias pau='pacmd set-card-profile bluez_card.00_18_09_A4_00_D0 a2dp_sink'

#### xqcd
if [[ -d $HOME/Workspace/xqcd/x/bin ]]; then
	export xpath="$HOME/Workspace/xqcd/x/"
	export PATH=$PATH:$HOME/Workspace/xqcd/x/bin
fi

######## conky ##########

if [[ -x $HOME/usr/scripts/conky.sh && $(pgrep conky) = "" && $(command -v conky) != "" ]]; then
	echo "Starting conky daemon"
	$HOME/usr/scripts/conky.sh >/dev/null 2>&1
fi
