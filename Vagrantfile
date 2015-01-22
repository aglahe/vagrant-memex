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

  config.vm.box ="aarong-vagrant/memex-client"

  # Since we use a Self signed cert..need to set to false
  config.vm.box_download_insecure = "true"

  config.vm.hostname = "memex-client"
  config.vm.synced_folder "./hadoop", "/etc/hadoop/conf"
  config.vm.synced_folder "./storm", "/etc/storm/conf"
  config.vm.synced_folder "./hive", "/etc/hive/conf"
  config.vm.synced_folder "./spark", "/etc/spark/conf"
  config.vm.synced_folder "./hbase", "/etc/hbase/conf"
  config.vm.synced_folder "./kafka", "/etc/kafka/conf"
  config.vm.synced_folder "./accumulo", "/etc/accumulo/conf"
  config.vm.synced_folder "./solr", "/etc/solr"
  config.vm.synced_folder "./impala", "/etc/impala/conf"

end
