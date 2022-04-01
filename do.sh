#!/usr/bin/env bash
#### zsh
dotfile_path=$(dirname `readlink -f $0`)

# if [[ ! -f ~/.oh-my-zsh/README.md ]]; then
	# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"; exit
# fi

if [[ -f $HOME/.zshrc ]]; then
	grep -q "source ${dotfile_path}/shell/shell.sh" ~/.zshrc || echo "source ${dotfile_path}/shell/shell.sh" >> ~/.zshrc
	#echo 'ZSH_THEME="agnoster"' >> ~/.zshrc
	sed -i "s|robbyrussell|fino-time|g"  ~/.zshrc
<<<<<<< HEAD
	if [[ -d $HOME/.oh-my-zsh ]]; then
=======
	if [[ -d $HOME/.oh-my-zsh/themes ]]; then
>>>>>>> 350a20c (update)
		cp ${dotfile_path}/shell/fino-time.zsh-theme ~/.oh-my-zsh/themes
	fi
fi

grep -q "source ${dotfile_path}/shell/shell.sh" ~/.bashrc|| echo "source ${dotfile_path}/shell/shell.sh" >> ~/.bashrc

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
[[ -f $HOME/Dropbox/Workspace/todo/conky.txt ]] && ln -sf $HOME/Dropbox/Workspace/todo/conky.txt ~/.todo.txt

#### git
[[ -f ~/.gitconfig ]] && mv ~/.gitconfig ~/.gitconfig.bak
ln -sf ${dotfile_path}/git/.gitconfig ~/.gitconfig
