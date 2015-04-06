# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

VAGRANT_COMMAND = ARGV[0]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  # Original starting point of the base box, and deploy script
  config.vm.box = "chef/centos-6.6"
  config.vm.provision :shell, :path => "basebox-create.sh"

  #config.vm.box ="aarong-vagrant/cdh-hadoop-client"
  #config.vm.box_download_insecure = "true"
  #config.vm.provision :shell, :path => "deploy.sh"

  config.vm.hostname = "memex-client"
  config.vm.synced_folder "./hadoop", "/etc/hadoop/conf.memex"
  config.vm.synced_folder "./storm", "/etc/storm/conf"
  config.vm.synced_folder "./hive", "/etc/hive/conf"
  config.vm.synced_folder "./spark", "/etc/spark/conf"
  config.vm.synced_folder "./hbase", "/etc/hbase/conf"
  config.vm.synced_folder "./kafka", "/etc/kafka/conf"
  config.vm.synced_folder "./accumulo", "/etc/accumulo/conf"
  config.vm.synced_folder "./solr", "/etc/solr"
  config.vm.synced_folder "./impala", "/etc/impala/conf"

  #  iPython Notebook forwarded port
  #config.vm.network "forwarded_port", guest: 8888, host: 18888

  # To use the same network as the Host OS is
  #config.vm.network "public_network"

end
