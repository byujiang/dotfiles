######################## useful functions ########################
## vim: ts=4 sw=4 ft=sh
function :q(){
	tput setaf 1;
	echo >&2 'This is not Vi(m) \::/'
	tput sgr0
	return 1
}

#### cowsay
function quote_today(){
	echo "############# Quote of The Day #############"
	fortune | cowsay -f tux
}
if  [[ $(command -v fortune) != "" && $(command -v cowsay) != "" ]]; then
	quote_today
fi

function mv_cut(){
	fs="$1"
	st=$2
	if [[ $# == 3 ]]; then
		ed=$3
		ffmpeg -i "$fs" -ss $st -to $ed -async 1 -c copy /tmp/dddddd.mp4
	else
		ffmpeg -i "$fs" -ss $st -async 1 -c copy /tmp/dddddd.mp4
	fi
	read replace
	if [[ $replace = '1' ]]; then
		mv /tmp/dddddd.mp4 "$fs"
		echo "will replace original video with cutted video"
	else
		echo "won't replace original video"
	fi
}


function luac(){
	# echo "$*"
	lua <<- EOF
log=math.log;  sqrt=math.sqrt;
sin=math.sin;  sinh=math.sinh;
cos=math.cos;  cosh=math.cosh;
tan=math.tan;  tanh=math.tanh;
abs=math.abs;  flr=math.floor
exp=math.exp;  rand=math.random;
pow=math.pow;  ceil=math.ceil;
max=math.max;  min=math.min;
mod=math.fmod; log10=math.log10;
pi=math.pi;    print($*)
	EOF
}

function pyc(){
	# echo "$*"
	python3 <<- EOF
from math import pi, sin, pow, cos, tan, sinh, cosh, tanh,\
				 exp, fabs, log, log10, modf, fmod, pow, floor
print($*)
	EOF
}

function calc(){
	pyc "$*"
}

function gcm(){
	json_path=~/tmp/ss/
	if [[ $# != 1 ]];then
		echo "Usage:\n gcm 0/4/6"
		return 130
	fi
	if [[ $1 == "0" ]]; then
		sudo systemctl stop gcm
	fi
	echo "Json path: ${json_path}"
	if [[ $1 == "4" || $1 == "6" ]]; then
		echo "Linking ss${1}.json to ss.json"
		ln -sf ${json_path}/ss${1}.json ${json_path}/ss.json
		echo "Restart gcm service"
		sudo systemctl restart gcm
	else
		echo "Option not acceptable. Only 0/4/6 are acceptable"
		return 130
	fi
}
function sss(){
	json_path=~/tmp/ss
	mm="gcm"
	# mm="libev"
	if [[ $# != 1 && $# != 2 ]]; then
		echo "Usage:\n sss 0/4/6 [gcm/libev]"
		return 130
	fi
	if [[ $1 == "0" ]]; then
		sudo systemctl stop $mm
		return
	fi
	if [[ $# == 2 ]]; then
		mm=$2
	fi
	if [[ $mm != "gcm" && $mm != "libev" ]];then
		echo "\$2 can be 'gcm' or 'libev' only."
		return 200
	fi
	echo "json path: ${json_path}"
	case "$1" in
		[46])
			echo "Linking ${mm}${1}.json to ${mm}.json"
			ln -sf ${json_path}/${mm}${1}.json ${json_path}/${mm}.json
			echo "Restart gcm service"
			sudo systemctl restart $mm
			;;
		0)
			echo "Stopping SS serivce"
			sudo systemctl stop $mm
			;;
		1)
			echo "Start showing log"
			tail -f /var/log/${mm}.log
			;;
		2)
			ls -lh ${json_path}/${mm}.json
			echo "q" | sudo systemctl status $mm
			echo ''
			;;
		*)
			echo "Option not acceptable. Only 0/1/4/6 are acceptable"
			return 130
			;;
	esac
}

function lpr2(){
	tmp_file=$(mktemp -u).$(date +"%Y.%m.%d.%H.%M").pdf
	if [[ $# -ne 1 && $# -ne 2 ]];then
		echo "This function is for printing file under linux in both side"
		echo -e "Usage:\n\t $(basename $0) file [page_range]"
		return 130
	fi
	if [[ $# == 1 ]]; then
		cp "$1" $tmp_file
	else
		if [[ $(command -v pdf-stapler) == "" ]]; then
			echo "You don't have pdf-stapler on your system. Please install pdf-stapler"
			return 150
		fi
		pdf-stapler cat "$1" "$2" $tmp_file
		if [[ $? != 0 ]]; then
			echo "The page-range you enter is not acceptable"
			return 130
		fi
	fi
	echo "Begin printing your document $1 now, tmp_file: $tmp_file"
	lpr -P ihep -o page-set=even -o fit-to-page -o outputorder=reverse -o orientation-requested=6 $tmp_file
	echo -en "Now put papers back to printer, and press return"
	read
	lpr -P ihep -o page-set=odd  -o fit-to-page $tmp_file
	echo "Finish printing your document $1, tmp_file: $tmp_file"
	rm -f $tmp_file
	echo "Delete tmp_file: $tmp_file"
}

function transmission4(){
	if [[ $# != 1 ]];then
		echo -e"Usage:\n\t this_file on/off"
		return 130
	fi
	pkill transmission-gtk
	if [[ $1 == "on" ]]; then
		echo "ipv4: 0.0.0.0-255.255.255.255" > ~/.config/transmission/blocklists/ipv4.dat
	fi
	if [[ $1 == "off" ]]; then
		rm -f ~/.config/transmission/blocklists/ipv4.dat*
	fi
	transmission-gtk >/dev/null 2>&1 &
	ls ~/.config/transmission/blocklists
}

###################################################################################
function test_conn(){
	ping -c 2 "$1" >/dev/null 2>&1 && echo "$1" connected || echo "$1" disconnected
}

function test_ssh(){
	ssh $1 exit >/dev/null 2&1 && echo "$1" connected || echo "$1" disconnected
}

function conn_check(){
	if [[ $# != 1 ]]; then
		echo -e "Usage:\n conn_check node.lst"
		return 130
	fi
	parallel -j 100 "ping -i 0.2 -c 2 {} >/dev/null 2>&1 || echo -e \"\t\033[0;31m cmbsd{} disconnected\033[0m\"" ::: < $1
}
function conn_check2(){
	parallel -j 100 "ping -i 0.2 -c 2 {} >/dev/null 2>&1 || echo -e \"\t\033[0;31m cmbsd{} disconnected\033[0m\"" ::: $*
}





##################################################################################
function jj(){
	Year=$(date +%Y)
	Mon=$(date +%m)
	Day=$(date +%d)
	jpath="$HOME/Dropbox/Workspace/journal/$Year/$Mon"
	jname="journal.${Year}.${Mon}.${Day}"

	mkdir -p $jpath
	test -f $jpath/${jname}.md || cp $jpath/../../template.md $jpath/${jname}.md
	test -f /usr/bin/code >/dev/null && edit="code" || edit="vim"
	$edit $jpath/${jname}.md >/dev/null 2>&1

}

function todo(){
	Year=$(date +%Y)
	Mon=$(date +%m)
	Day=$(date +%d)
	mkdir -p ~/Dropbox/Workspace/journal/$Year/$Mon
	cd ~/Dropbox/Workspace/journal/$Year/$Mon
	cp ../../template.md todo.${Year}.${Mon}.${Day}.md
	command -v code >/dev/null && set edit="code" || set edit="vim"
	$edit todo.${Year}.${Mon}.${daY}.md >/dev/null 2>&1
}

##################################################################
type take > /dev/null 2>&1
if [[ $? != 0 ]]; then
	function take(){
		mkdir -p $@ && cd ${@:$#}
	}
fi

type lst > /dev/null 2>&1

if [[ $? != 0 ]];then
	function lst(){
		ls *.${1}
	}
fi

##################################################################
function eospath(){
	if [[ ! -f $1 ]]; then
		echo "$1 not exist!!!!"
		exit 130
	fi
	eos file info $1 --fullpath
	if [[ $2 -eq 1 ]]; then
		rm -f $1
	fi

}
