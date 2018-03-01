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
	if [[ -d /Applications/CMake.app/Contents/bin ]];then
		export PATH=$PATH:/Applications/CMake.app/Contents/bin
	fi

	#### ROOT
	if [[ -d /Applications/root/bin/ ]]; then
		export PATH=$PATH:/Applications/root/bin
	fi

	#### TexLive 2017
	if [[ -d /usr/local/texlive/2017/bin/x86_64-darwin/ ]]; then
		export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-darwin
	fi

	#### Python 3.6
	if [[ -d /Library/Frameworks/Python.framework/Versions/3.6/bin ]]; then
		export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin
	fi

	#### Qt 5.9
	if [[ -d /usr/local/qt/5.9/clang_64/bin ]];then
		export PATH=$PATH:/usr/local/qt/5.9/clang_64/bin
		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/qt/5.9/clang_64/lib/pkgconfig
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
fi
############################
