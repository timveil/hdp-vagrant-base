Vagrant.configure("2") do |config|
	config.vm.box = "chef/centos-6.6"
	
	config.vm.provision :shell, path: "bootstrap.sh"

	config.vm.hostname = "hdp2201.dev.local"

	config.vm.network "private_network", ip: "192.168.66.101"

	config.vm.provider "virtualbox" do |v|
		v.memory = 8192
		v.cpus = 4
		v.name = "hdp2201.dev.local"
	end
end