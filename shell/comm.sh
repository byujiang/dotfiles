####################### common configuration #####################
# vim: ts=4 sw=4 ft=sh

#### system part
export EDITOR=vim
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
#export LC_CTYPE=en_US.UTF-8
# export XMODIFIERS=@im=fcitx

#### clash
if [[ $(pgrep clash) != "" ]]; then
	export all_proxy=http://localhost:7890/
	export http_proxy=http://localhost:7890/
	export socks_proxy=socks5://localhost:7891/
fi

if [[ -d $HOME/Workspace/rismom/analysis/python ]];then
	export PATH=$PATH:$HOME/Workspace/rismom/analysis/python
fi

#### git218 or git212 for centos 7
if [[ -f /opt/rh/rh-git218/enable ]]; then
	source /opt/rh/rh-git218/enable
elif [[ -f /opt/rh/rh-git212/enable ]]; then
	source /opt/rh/rh-git212/enable
fi

#### HOME path and include and libs
export PATH=$HOME/.local/bin:$HOME/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/usr/lib:/usr/local/lib:/usr/local/lib64:$HOME/.local/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/usr/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$HOME/usr/include

#### oh-my-zsh
if [[ $SHELL == "" ]]; then
	export SHELL="$(readlink /proc/$$/exe)"
fi
if [[ $SHELL == "zsh" &&  -f $HOME/.oh-my-zsh/README.md ]]; then
	plugins=( cp dnf git pip python rsync ssh-agent sudo systemd shell vim-interaction yum tmux thefuck npm node docker )
fi

#### nvidia cuda
CUDA_HOME=/usr/local/cuda/
if [[ -f $CUDA_HOME/bin/nvcc ]]; then
	export PATH=$PATH:$CUDA_HOME/bin:$CUDA_HOME/nvvm/bin
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64/:$CUDA_HOME/lib64/stubs:$CUDA_HOME/nvvm/lib64
	export C_INCLUDE_PATH=$C_INCLUDE_PATH:$CUDA_HOME/include:$CUDA_HOME/nvvm/include
	export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$CUDA_HOME/include:$CUDA_HOME/nvvm/include
fi

#### SHELL
if [[ $SHELL == "" ]]; then
	export SHELL="$0"
fi
#### oh-my-zsh
if [[ $SHELL == "zsh" &&  -f $HOME/.oh-my-zsh/README.md ]]; then
	plugins=( cp dnf git pip python rsync ssh-agent sudo systemd shell vim-interaction yum tmux thefuck npm node docker )
fi

### PS1
if [[ $(basename $SHELL) == "bash" ]]; then
	export PS1="\[\033[1;32m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;35m\]\u@\h';fi)\[\033[1;32m\])\342\224\200(\[\033[1;31m\]\$?\[\033[1;32m\])\342\224\200(\[\033[1;36m\]\@ \d\[\033[1;32m\])\n\342\224\224[\[\033[1;33m\]\w\[\033[1;32m\]]\342\224\200\[\033[1;31m\]|> \[\033[0m\]"
fi

#### TERM
export TERM='xterm'

if [[ $(uname -a) =~ "microsoft" ]]; then
	export DISPLAY=$(awk '/nameserver/ {print $2}' /etc/resolv.conf):0.0
fi
