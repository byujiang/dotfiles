#!/bin/bash
cd /home/amito/.dotfiles/conky
conky -d -c conkyrc >/dev/null 2>&1
conky -d -c sliderc >/dev/null 2>&1
conky -d -c todorc >/dev/null 2>&1
