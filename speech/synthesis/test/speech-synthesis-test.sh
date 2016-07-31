#!/bin/sh

/home/vagrant/speech/synthesis/festival/bin/text2wave \
 /vagrant/speech/synthesis/test/speech-synthesis-test-input.txt \
 -o /vagrant/speech/synthesis/test/speech-synthesis-test-output.wav \
 -eval '(voice_eki_et_riina_clunits)'
