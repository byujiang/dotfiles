# fino-time.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo 'o' && return
    echo 'o'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}


rvm_ruby=''
if type rvm-prompt &>/dev/null; then
    rvm_ruby='using%{$FG[243]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
fi

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local returncode="-%{$fg[red]%}(%?)%{$FG[142]%}"
function last_return_code(){
	local LAST_EXIT_CODE=$?
	if [[ $last_exit_code == "0" ]]; then
		exit_prompt="-(%{$FG[040]%}$LAST_EXIT_CODE%{$FG[142]%})"
	else
		exit_prompt="-(%{$FG[150]%}$LAST_EXIT_CODE%{$FG[142]%})"
	fi
	echo "$exit_prompt"
}

# PROMPT="╭─%{$FG[040]%}%n%{$reset_color%}%{$FG[142]%}@%{$reset_color%}%{$FG[033]%}$(box_name)%{$reset_color%}:%{$FG[239]%}%{$reset_color%}%{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info}%{$FG[142]%}${rvm_ruby}-(%D %*)$(last_return_code)
PROMPT="╭─%{$FG[040]%}%n%{$reset_color%}%{$FG[142]%}@%{$reset_color%}%{$FG[033]%}$(box_name)%{$reset_color%}: %{$FG[239]%}%{$reset_color%}%{$terminfo[bold]$FG[226]%}${current_dir} %{$reset_color%}${git_info}%{$FG[142]%}${rvm_ruby}(%D %*)${returncode}%{$reset_color%}
╰─$(virtualenv_info)$FG[226]$(prompt_char) %{$reset_color%}"
#╰─$(virtualenv_info)$(prompt_char) λ "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
