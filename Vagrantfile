# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

VAGRANT_COMMAND = ARGV[0]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Original starting point of the base box, and deploy script
  #config.vm.box = "bento/centos-6.7"
  #config.vm.provision :shell, :path => "basebox-create.sh"

  config.vm.box = "dsra-client"
  config.vm.box_url ="https://memexproxy.com/vagrant/dsra-client.box"
  config.vm.provision :shell, :path => "deploy.sh"

  config.vm.hostname = "memex-client"
  config.vm.synced_folder "./hadoop", "/etc/hadoop/conf.memex"
  config.vm.synced_folder "./spark/conf.cdh", "/etc/spark/conf"
  config.vm.synced_folder "./spark/conf.apache", "/opt/spark/conf"
  config.vm.synced_folder "./hive", "/etc/hive/conf"
  config.vm.synced_folder "./hbase", "/etc/hbase/conf"
  config.vm.synced_folder "./kafka", "/etc/kafka/conf"

  # To use the same network as the Host OS is
  #config.vm.network "public_network"

end
