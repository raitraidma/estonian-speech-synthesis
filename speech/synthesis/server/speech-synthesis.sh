#!/bin/sh

/home/vagrant/speech/synthesis/festival/bin/text2wave \
 $1 \
 -o "$1.wav" \
 -eval '(voice_eki_et_riina_clunits)'
