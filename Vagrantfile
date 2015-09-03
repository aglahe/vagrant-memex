# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

VAGRANT_COMMAND = ARGV[0]

  #Default numbers given to VM
memAllocated=4096
coresAllocated=2

#Asks for desired Memory Allocation
puts "If running 'vagrant up', please enter how many Gigabytes of Memory you wish to allocate yo your Vagrant Machine (1/2/4/8)"
puts "If running other vagrant command (e.g. 'vagrant halt'), please provide moot input: "
puts `read input; exit $input`

if memAllocated == 1
         print "1 Gig has been allocated to your Vagrant Machine\n"
         memAllocated=1024
elsif memAllocated == 2
        print "2 Gigs have been allocated to your Vagrant Machine\n"
elsif memAllocated == 4
        print "4 Gigs have been allocated to your Vagrant Machine\n"
elsif memAllocated == 8
        print "8 Gigs have been allocated to your Vagrant Machine\n"
        memAllocated=8192
else
        print "Error, invalid entry for VM Memory. Defaulting to 4096 MB!"
        memAllocated=4096
end

puts "If running 'vagrant up', please enter how many Cores you wish to allocate to your Vagrant Machine ('1'/'2'/'4') "
puts "If running other vagrant commands (e.g. 'vagrant halt'), provide moot input:\n "
puts `read corein; exit $corein`
coresAllocated = $?.exitstatus

if coresAllocated == 1
        print "1 Core has been allocated to your Vagrant Machine\n"
elsif coresAllocated == 2
        print "2 Cores have been allocated to your Vagrant Machine\n"
elsif coresAllocated == 4
        print "4 Cores have been allocated to your Vagrant Machine\n"
else
        print "Error, invalid entry for VM Cores. Defaulting to 2 Cores!"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = memAllocated
    v.cpus = coresAllocated
  end

  # Original starting point of the base box, and deploy script
  #config.vm.box = "chef/centos-6.6"
  #config.vm.provision :shell, :path => "basebox-create.sh"

  config.vm.box ="aarong-vagrant/cdh-hadoop-client"
  config.vm.box_download_insecure = "true"
  config.vm.provision :shell, :path => "deploy.sh"

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
