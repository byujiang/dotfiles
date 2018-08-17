#### zsh
dotfile_path=$(dirname `readlink -f $0`)

grep -q "source \${dotfile_path}/shell/shell.sh" ~/.zshrc || echo "source \${dotfile_path}/shell/shell.sh" >> ~/.zshrc
grep -q "source \${dotfile_path}/shell/shell.sh" ~/.bashrc || echo "source \${dotfile_path}/shell/shell.sh" >> ~/.bashrc

ln -sf ${dotfile_path}/shell/alias.sh ~/.alias.ext
ln -sf ${dotfile_path}/shell/macos.sh ~/.macos.ext
ln -sf ${dotfile_path}/shell/comm.sh ~/.comm.ext
ln -sf ${dotfile_path}/shell/func.sh ~/.func.ext

#### ipython
mkdir -p ~/.ipython/profile_default
ln -sf ${dotfile_path}/ipython/profile/ipython_config.py ~/.ipython/profile_default/
ln -sf ${dotfile_path}/ipython/profile/ipython_kernel_config.py ~/.ipython/profile_default/
if [[ -d ~/.ipython/profile_default/startup ]]; then
	rm -rf ~/.ipython/profile_default/startup;
fi
ln -sf ${dotfile_path}/ipython/profile/startup ~/.ipython/profile_default/

####
ln -sf ${dotfile_path}/tmux/tmux.conf ~/.tmux.conf
ln -sf ${dotfile_path}/vim/vimrc ~/.vimrc
mkdir -p ~/.config && rm -rf ~/.config/mpv
ln -sf ${dotfile_path}/mpv ~/.config/

mkdir -p $HOME/usr/bin
ln -sf ${dotfile_path}/conky/conky.sh ~/usr/bin/
