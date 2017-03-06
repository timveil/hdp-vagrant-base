# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.box_check_update = true

  config.vbguest.auto_update = false

  config.vbguest.no_remote = true

  config.vbguest.no_install = true

  config.vm.network "private_network", type: "dhcp"

  # workaround for known issue #2 https://seven.centos.org/2016/12/updated-centos-vagrant-images-available-v1611-01/
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.name = 'base.hdp.local'
  end

  config.vm.provision "base", type: "shell", path: "provision-base.sh"

end