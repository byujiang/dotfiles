#!/bin/bash -

function display_todo(){
	file=$1
	if [[ ! -f $file ]]; then
		echo "File $file not found"
		return 130
	fi
	while read line
	do
		if [[ ${line:0:1} == "1" ]]; then
			echo -e "\${offset 0}\${color green}  ${line:1:${#line}}"
		else
			echo -e "\${offset 190}\${color cyan} | ${line:1:${#line}}"
		fi
	done < "$file"
}

file="$HOME/.todo.txt"
display_todo $file
# LTIME=`stat -c %Z $file`
# while true
# do
	# ATIME=`stat -c %Z $file`
	# if [[ $ATIME != $LTIME ]]; then
		# display_todo "$1"
	# else
		# sleep 10
	# fi
# done

