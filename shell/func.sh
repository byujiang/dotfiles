######################## useful functions ########################
#### cowsay
if  [[ $(command -v fortune) != "" && $(command -v cowsay) != "" ]]; then
	function quote_today(){
		echo "############# Quote of The Day #############"
		fortune | cowsay -f tux
		# echo "=============================================================="
	}
	quote_today
fi

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
	if [[ $# != 1 ]];then
		echo "Usage:\n gcm 0/4/6"
		return 130
	fi
	if [[ $1 == "0" ]]; then
		sudo systemctl stop libev
		return
	fi
	echo "Json path: ${json_path}"
	if [[ $1 == "4" || $1 == "6" ]]; then
		echo "Linking libev${1}.json to libev.json"
		ln -sf ${json_path}/libev${1}.json ${json_path}/libev.json
		echo "Restart libev service"
		sudo systemctl restart libev
	else
		echo "Option not acceptable. Only 0/4/6 are acceptable"
		return 130
	fi
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
