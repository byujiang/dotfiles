#!/bin/bash -
set -o nounset                              # Treat unset variables as an error

dir=$1
dim=$2

if [[ $# != 2 ]]; then
	echo -e "Usage:\n thisfile dir dim"
	exit 160
fi
if [[ ! -d $dir ]]; then
	echo $dir not found, please check your input
	exit 130
fi

if [[ $dim == "small" ]]; then
	geo="158x100"
	pos="155,214"
elif [[ $dim == "medium" ]]; then
	geo="238x148"
	pos="185,175"
elif [[ $dim == "large" ]]; then
	geo="560x350"
	pos="10,0"
else
	echo "dim is $dim which is not acceptable. dim can only be small, medium or large"
	exit 160
fi

#### choose random picture ###
files=($dir/*.*)
let r="$RANDOM % ${#files[*]}"
randfile=${files[$r]}

convert $randfile -resize $geo\> -size $geo xc:black +swap -gravity center -composite /tmp/conky_current.png
# convert pix/photobg_bg_${dim}.png /tmp/conky_current.png -geometry +11+11 -composite /tmp/conky_result.png
# convert /tmp/conky_result.png pix/photobg_shadow_${dim}.png -composite /tmp/conky_result.png
# convert /tmp/conky_current.png pix/photobg_shadow_${dim}.png -composite /tmp/conky_result.png
# echo "\${image /tmp/conky_result.png -p $pos}"
echo "\${image /tmp/conky_current.png -p $pos}"
exit
