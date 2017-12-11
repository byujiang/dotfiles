#!/bin/bash -

current_path=`pwd -P`

ln -sf ${current_path}/bash/bashrc.ext ~/.bashrc.ext
echo "test -f ~/.bashrc.ext && source ~/.bashrc.ext" >> ~/.bashrc
ln -sf ${current_path}/zsh/zshrc.ext ~/.zshrc.ext
echo "test -f ~/.zshrc.ext && source ~/.zshrc.ext" >> ~/.zshrc

#### ipython
mkdir -p ~/.ipython/profile_default
ln -sf ${current_path}/ipython/profile/ipython_config.py ~/.ipython/profile_default/
ln -sf ${current_path}/ipython/profile/ipython_kernel_config.py ~/.ipython/profile_default/
if [[ -d ~/.ipython/profile_default/startup ]]; then
	rm -rf ~/.ipython/profile_default/startup;
fi
ln -sf ${current_path}/ipython/profile/startup ~/.ipython/profile_default/

####
mkdir -p ~/.config
ln -sf ${current_path}/mpv ~/.config/mpv
ln -sf ${current_path}/tmux/tmux.conf ~/.tmux.conf
ln -sf ${current_path}/vim/vimrc ~/.vimrc
