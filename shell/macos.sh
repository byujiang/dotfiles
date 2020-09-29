############################ macOS #######################
#### vim: ts=4 sw=4 ft=sh
if [[ `uname` == "Darwin" ]]; then
	########## alias #########
	alias ls='ls -G'
	alias show='defaults write com.apple.finder AppleShowAllFiles -bool true'
	alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false'
	alias updatedb='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist'

	#### ftp
	alias ftpon='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'
	alias ftpoff='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'
fi

#### MySQL
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'

#### QMBF
if [[ -d /Applications/QMBF.app/ ]]; then
	export PATH=$PATH:/Applications/QMBF.app/Contents/MacOS
fi
if [[ -d /Applications/Qtgrace.app ]]; then
	export PATH=$PATH:/Applications/Qtgrace.app/Contents/MacOS
fi

#### CMake.app
CMAKE_HOME=/Applications/Cmake.app
if [[ -d $CMAKE_HOME/Contents/bin ]];then
	export PATH=$PATH:$CMAKE_HOME/Contents/bin
fi

#### ROOT
ROOT_DIR=/Applications/root
if [[ -d $ROOT_DIR/bin/ ]]; then
	export PATH=$PATH:$ROOT_DIR/bin
	export ROOT_HOME=$ROOT_HOME
fi

#### TexLive 2020
TEX_HOME=/usr/local/TexLive/2020/bin/x86_64-darwin
[[ -d $TEX_HOME ]] && export PATH=$PATH:$TEX_HOME

#### Python 3.8
PY_HOME=/Library/Frameworks/Python.framework/Versions/3.8/
if [[ -d $PY_HOME/bin ]]; then
	export PATH=$PATH:$PY_HOME/bin
fi

#### Qt 5.12
QT_HOME=/usr/local/qt/5.12/clang_64
if [[ -d $QT_HOME/bin ]];then
	export PATH=$PATH:$QT_HOME/bin
	export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$QT_HOME/lib/pkgconfig
fi

#### watch
function watch(){
	while :;do
		clear
		$1
		sleep $2
	done
}
######### Wi-Fi ############
function v4off(){
	sudo networksetup -setv4off Wi-Fi
	sudo networksetup -setdnsservers Wi-Fi 2001:4860:4860::8888 8.8.8.8
	ssh -6 -N -D 7070  darkshell 1>/dev/null &
	sudo networksetup -setsocksfirewallproxystate Wi-Fi on
	sudo networksetup -setsocksfirewallproxy Wi-Fi localhost 1080
}
function v4on(){
	sudo networksetup -setdhcp Wi-Fi
	sudo networksetup -setdnsservers Wi-Fi Empty
	sudo networksetup -setsocksfirewallproxystate Wi-Fi off
}
############################
