# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.box_check_update = false

  config.vbguest.auto_update = false

  config.vbguest.no_remote = true

  config.vbguest.no_install = true

  config.vm.provision "installJava", type:  "shell", inline: $installJava

  config.vm.provision "base", type: "shell", path: "provision-base.sh"

  config.vm.provision "file", source: "set-java-home.sh", destination: "/tmp/set-java-home.sh"

  config.vm.provision "file", source: "jce_policy-8.zip", destination: "/tmp/jce_policy-8.zip"

  config.vm.provision "updateJava", type:  "shell", inline: $updateJava

  config.vm.provision "applyJCE", type:  "shell", inline: $applyJCE

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.name = 'base.hdp.local'
  end

end

$installJava = <<SCRIPT
echo "******* installing java jdk"

yum install java-1.8.0-openjdk-devel -y

SCRIPT

$updateJava = <<SCRIPT

mv /tmp/set-java-home.sh /etc/profile.d/set-java-home.sh

chmod a+x /etc/profile.d/set-java-home.sh

source /etc/profile

SCRIPT

$applyJCE = <<SCRIPT

sudo unzip -o -j -q /tmp/jce_policy-8.zip -d $JAVA_HOME/jre/lib/security/

SCRIPT