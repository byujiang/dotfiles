#### zsh
current_path=$(pwd -P)

grep -q "export dotfile_path=${current_path}" ~/.zshrc|| echo "export dotfile_path=${current_path}" >> ~/.zshrc
grep -q "export dotfile_path=${current_path}" ~/.bashrc|| echo "export dotfile_path=${current_path}" >> ~/.bashrc

grep -q "source ${current_path}/shell/shell.sh" ~/.zshrc || echo "source ${current_path}/shell/shell.sh" >> ~/.zshrc
grep -q "source ${current_path}/shell/shell.sh" ~/.bashrc || echo "source ${current_path}/shell/shell.sh" >> ~/.bashrc

ln -sf ${current_path}/shell/alias.sh ~/.alias.ext
ln -sf ${current_path}/shell/macos.sh ~/.macos.ext
ln -sf ${current_path}/shell/comm.sh ~/.comm.ext
ln -sf ${current_path}/shell/func.sh ~/.func.ext

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
ln -sf ${current_path}/conky/conkyrc ~/.conkyrc
mkdir -p ~/.config && rm -rf ~/.config/mpv
ln -sf ${current_path}/mpv ~/.config/
