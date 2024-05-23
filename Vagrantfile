# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "private_network", ip: "192.168.56.205"
  config.vm.hostname = "myk8s"
  #config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.provision :shell, path: "bootstrap.sh"
  # move to box to run by clent box
  config.vm.provision "file", source: "bootstrap_kind_cluster.sh", destination: "~/bootstrap_kind_cluster.sh"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2096
    v.cpus = 2
    v.name = "myk8s"
  end
end