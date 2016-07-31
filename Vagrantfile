# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
  end

  config.vm.define "speech_synthesis" do |speech_synthesis|
    speech_synthesis.vm.box = "webhippie/centos-7"
    speech_synthesis.vm.provision :shell, path: "speech-synthesis-bootstrap.sh"
    speech_synthesis.vm.network "forwarded_port", guest: 9999, host: 9999
  end
end
