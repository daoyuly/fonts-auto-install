#!/bin/bash

FONTS_DIR=$HOME/Library/Fonts
FONTS_LIST=("Menlo-Regular.ttf" "DejaVuSansMono.ttf" "FiraCode-Regular.ttf" "Inconsolata-Regular.ttf")

function die () {
    echo "${@}"
    exit 1
}

cat <<EOF
--------------------------
    Fonts Auto Install
--------------------------

EOF

if [[ ! -e $FONTS_DIR ]]; then
    mkdir $FONTS_DIR || die "Could not make $FONTS_DIR"
fi

for i in ${FONTS_LIST[*]}; do
    echo "Downloading $i"; echo
    wget -c https://github.com/daoyuly/fonts-auto-install/blob/main/fonts/mac/$i \
      || die "Fail to download ${i}"
    mv $i $FONTS_DIR || die "Could not install $i"
    echo "Installed $i successfully"; echo
done

cat <<EOF
--------------------------
    Fonts installed!
--------------------------

EOF