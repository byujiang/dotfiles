#!/bin/bash

dotfile_path=$(dirname `readlink -f $0`)
cd $dotfile_path
conky -d -c conkyrc >/dev/null 2>&1
#conky -d -c sliderc >/dev/null 2>&1
conky -d -c todorc >/dev/null 2>&1
cd -
