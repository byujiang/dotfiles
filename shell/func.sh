######################## useful functions ########################
function test_conn(){
	ping -c 2 "$1" >/dev/null 2>&1 && echo "$1" connected || echo "$1" disconnected
}

function test_ssh(){
	ssh $1 exit >/dev/null 2&1 && echo "$1" connected || echo "$1" disconnected
}
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

function sss(){
	opt=$1
	json_path=~/tmp/ss/
	old_path=$(pwd)
	if [[ $opt == "" ]]; then
		echo "Usage:\n sss 4/6"
		return 130
	fi
	if [[ $1 == "0" ]]; then
		sudo systemctl stop gcm
		return
	fi
	if [[ $1 == "1" ]]; then
		sudo systemctl restart gcm
		return
	fi

	cd ${json_path}
	ln -fs ss${opt}.json ss.json
	sudo systemctl restart gcm
	cd ${old_path}
}
function ssltart(){
	config=$1
	test -e $config || return
	logfile=${config//json/log}
	pidfile=${config/json/pid}
	sslocal -q -c $config --pid-file $pidfile --log-file $logfile -d start
}
function ssstart(){
	config=$1
	test -e $config || return
	logfile=${config//json/log}
	pidfile=${config/json/pid}
	ssserver -q -c $config --pid-file $pidfile --log-file $logfile -d start
}
