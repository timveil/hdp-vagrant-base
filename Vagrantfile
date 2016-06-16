# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.box_check_update = true

  config.vbguest.auto_update = false

  config.vbguest.no_remote = true

  config.vbguest.no_install = true

  config.vm.provision "base", type: "shell", path: "provision-base.sh"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.name = 'base.hdp.local'
  end

end