Vagrant.configure("2") do |config|
	config.vm.box = "chef/centos-6.6"

	# bootstrap and cleanup box
	config.vm.provision "bootstrap", type: "shell", path: "bootstrap.sh"

    # install Ambari
	config.vm.provision "ambari", type: "shell", path: "ambari.sh"

	# install cluster: min.sh or all.sh
	config.vm.provision "cluster", type: "shell", path: "min.sh"

	config.vm.hostname = "hdp2201.dev.local"

	config.vm.network "private_network", ip: "192.168.66.101"

	config.vm.provider "virtualbox" do |v|
		v.memory = 8192
		v.cpus = 4
		v.name = "hdp2201.dev.local"
	end
end