#!/bin/bash -

current_path=$(pwd -P)

ln -sf ${current_path}/bash/bashrc.ext ~/.bashrc.ext
ln -sf ${current_path}/zsh/zshrc.ext ~/.zshrc.ext
ln -sf ${current_path}/shell/func.sh ~/.func.ext
ln -sf ${current_path}/shell/alias.sh ~/.alias.ext

grep -q "test -f ~/.bashrc.ext" ~/.bashrc || echo "test -f ~/.bashrc.ext && source ~/.bashrc.ext" >> ~/.bashrc
grep -q "test -f ~/.func.ext" ~/.bashrc || echo "test -f ~/.func.ext && source ~/.func.ext" >> ~/.bashrc
grep -q "test -f ~/.alias.ext" ~/.bashrc || echo "test -f ~/.alias.ext && source ~/.alias.ext" >> ~/.bashrc
grep -q "test -f ~/.zshrc.ext" ~/.zshrc || echo "test -f ~/.zshrc.ext && source ~/.zshrc.ext" >> ~/.zshrc
grep -q "test -f ~/.func.ext" ~/.zshrc || echo "test -f ~/.func.ext && source ~/.func.ext" >> ~/.zshrc
grep -q "test -f ~/.alias.ext" ~/.zshrc || echo "test -f ~/.alias.ext && source ~/.alias.ext" >> ~/.zshrc

#### ipython
mkdir -p ~/.ipython/profile_default
ln -sf ${current_path}/ipython/profile/ipython_config.py ~/.ipython/profile_default/
ln -sf ${current_path}/ipython/profile/ipython_kernel_config.py ~/.ipython/profile_default/
if [[ -d ~/.ipython/profile_default/startup ]]; then
	rm -rf ~/.ipython/profile_default/startup;
fi
ln -sf ${current_path}/ipython/profile/startup ~/.ipython/profile_default/

####
ln -sf ${current_path}/tmux/tmux.conf ~/.tmux.conf
ln -sf ${current_path}/vim/vimrc ~/.vimrc
mkdir -p ~/.config && rm -rf ~/.config/mpv
ln -sf ${current_path}/mpv ~/.config/mpv
