#!/usr/bin/env bash -
#### vim: ts=4 sw=4 ft=sh
# export dotfile_path=$(dirname $(readlink -f $0))
export dotfile_path="$HOME/dev/dotfiles/shell"

source ${dotfile_path}/comm.sh
source ${dotfile_path}/func.sh
source ${dotfile_path}/alias.sh
# source ${dotfile_path}/macos.sh

unset dotfile_path

