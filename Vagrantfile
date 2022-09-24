VAGRANTFILE_API_VERSION = "2"
PROJECT_NAME = "playground"
NETWORK_IP = "192.168.56"
OFFSET = 10

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # hosts resolver
  config.vm.provision :hosts do |resolver|
    resolver.add_host "#{NETWORK_IP}.#{OFFSET}", ["master"]
    (1..2).each do |i|
      resolver.add_host "#{NETWORK_IP}.#{OFFSET+i}", ["worker-#{i}"]
    end
  end

  # default image
  config.vm.provider :virtualbox do |base|
    base.linked_clone = true
    base.name = "base"
  end
  
  # master
  config.vm.define "master" do |master|
  master.vm.box = "generic/ubuntu2204"
  master.vm.provider "virtualbox" do |vm|
    vm.name = "#{PROJECT_NAME}-master"
    vm.cpus = 2
    vm.memory = 1024
  end
  master.vm.hostname = "master"
  master.vm.network :private_network, ip: "#{NETWORK_IP}.#{OFFSET}"
  master.vm.provision :hosts, :sync_hosts => true
  master.vm.synced_folder "./ansible", "/home/vagrant/ansible", create: true
  end

  # worker
  (1..2).each do |i|
    config.vm.define "worker-#{i}" do |worker|
    worker.vm.box = "generic/ubuntu2204"
    worker.vm.provider "virtualbox" do |vm|
      vm.name = "#{PROJECT_NAME}-worker-#{i}"
      vm.cpus = 2
      vm.memory = 2048
    end
    worker.vm.hostname = "worker-#{i}"
    worker.vm.network :private_network, ip: "#{NETWORK_IP}.#{OFFSET+i}"
    worker.vm.provision :hosts, :sync_hosts => true
    end
  end
end
