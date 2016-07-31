#!/bin/sh

yum -y group install "Development Tools"
yum install -y python-tornado

yum langinstall et_EE
localedef -v -c -i et_EE -f UTF-8 et_EE.UTF-8
export LANG="et_EE.UTF-8"
echo 'LANG="et_EE.UTF-8"' | tee /etc/locale.conf

source "/vagrant/speech-synthesis-installation.sh"