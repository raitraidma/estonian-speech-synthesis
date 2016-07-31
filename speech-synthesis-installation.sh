#!/bin/sh

DIR=/home/vagrant/speech/synthesis
mkdir -p $DIR
cd $DIR
rm -rf ./*

wget http://www.festvox.org/packed/festival/2.4/speech_tools-2.4-release.tar.gz
wget http://www.festvox.org/packed/festival/2.4/festival-2.4-release.tar.gz
wget http://www.festvox.org/packed/festival/2.4/festlex_CMU.tar.gz
wget http://www.festvox.org/packed/festival/2.4/festlex_OALD.tar.gz
wget http://www.festvox.org/packed/festival/2.4/festlex_POSLEX.tar.gz
wget http://www.festvox.org/packed/festival/2.4/voices/festvox_kallpc16k.tar.gz
wget http://www.festvox.org/packed/festival/2.4/voices/festvox_rablpc16k.tar.gz
wget http://heli.eki.ee/festvox_eki_et_riina_clunits.tar.gz
wget http://heli.eki.ee/koduleht/images/koduleht/eki_et_tonu_hts.tar.gz

tar xvfz festival-2.4-release.tar.gz
tar xvfz speech_tools-2.4-release.tar.gz

cd "$DIR/speech_tools"
./configure
make

cd "$DIR/festival"
./configure
make

cd $DIR
tar xvfz festlex_CMU.tar.gz
tar xvfz festlex_OALD.tar.gz
tar xvfz festlex_POSLEX.tar.gz
tar xvfz festvox_kallpc16k.tar.gz
tar xvfz festvox_rablpc16k.tar.gz
tar xvfz festvox_eki_et_riina_clunits.tar.gz

mkdir "$DIR/festival/lib/voices/hts"
tar xvfz eki_et_tonu_hts.tar.gz -C "$DIR/festival/lib/voices/hts"

# Default synthesis output is in .wav format and is saved to /vagrant/speech/synthesis/test/output.wav
echo "(Parameter.set 'Audio_Method 'Audio_Command)" > /home/vagrant/.festivalrc
echo "(Parameter.set 'Audio_Required_Format 'wav)" >> /home/vagrant/.festivalrc
echo "(Parameter.set 'Audio_Command \"rm -f /vagrant/speech/synthesis/test/output.wav; mv \$FILE /vagrant/speech/synthesis/test/output.wav\")" >> /home/vagrant/.festivalrc

chmod 777 /vagrant/speech/synthesis/server/server.py
chmod 777 /vagrant/speech/synthesis/server/speech-synthesis.sh

sudo cp -f /vagrant/speech/synthesis/server/synthesis-service /etc/init.d/synthesis
service synthesis start
