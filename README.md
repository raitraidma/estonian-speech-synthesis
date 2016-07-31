Estonian speech synthesis
=========================

MY DEVELOPMENT MACHINE
----------------------
* Processor: Intel(R) Core(TM) i5-3427U CPU @ 1.80GHz
* Memory: 8,00 GB
* OP system: Windows 7

REQUIREMENTS
------------
* Oracle VM VirtualBox 4.3.20
* Vagrant 1.7.2

SETUP
-----
* Start command line as an Administrator
* Go to folder where `Vagrantfile` is located
* Run: `vagrant up`

To access VM, open Putty:
* Host: localhost
* Port: 2222
* Username: vagrant
* Password: vagrant

Speech synthesis example
------------------------

Option 1:
* Open browser: `localhost:9999/?text=Tere maailm`
* This returns .wav file

Option 2:
* run: `/vagrant/speech/synthesis/test/speech-synthesis-test.sh`
* This script takes `/vagrant/test/speech_synthesis_test_input.txt` (Must have and ANSI encoding) as an input and generates `/vagrant/test/speech_synthesis_test_output.wav` as an output.

Option 3:
* run: `/home/vagrant/speech/synthesis/festival/bin/festival`
* This opens festival program. Type:
  * `(voice_eki_et_riina_clunits)`
  * `(SayText "Tere, mina olen Riina.")`
* Output file is in `/vagrant/speech/synthesis/test/output.wav`