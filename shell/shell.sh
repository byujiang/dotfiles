#!/bin/bash
#### vim: ts=4 sw=4 ft=sh
export dotfile_path="$(cd "$( dirname "${BASH_SOURCE[0]-$0}" )" && pwd )"

source ${dotfile_path}/comm.sh
source ${dotfile_path}/func.sh
source ${dotfile_path}/alias.sh
# source ${dotfile_path}/macos.sh

unset dotfile_path

