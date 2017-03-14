VAGRANTFILE_API_VERSION = "2"
# Require YAML module
require 'yaml'

# Read YAML file with box details
servers = YAML.load_file('hosts.yaml')

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers['name'] do |srv|
      srv.vm.box = servers['box']
      srv.vm.hostname = servers['name']
      srv.vm.network "private_network", ip: servers["ip"]
      if servers['name'] == "manager1"
        srv.vm.network :forwarded_port, guest: 5432, host: 7001
      end
      if servers['name'] == "edge"
        srv.vm.network :forwarded_port, guest: 5432, host: 7002
      end
      srv.vm.provider :virtualbox do |vb|
        vb.memory = servers['ram']
        vb.gui = true
        vb.cpus = servers['cpu']
      end
      srv.vm.synced_folder servers['folder'], "/home/vagrant/hosts"
      srv.vm.provision :shell, :path  => servers['provision']
    end
  end
   
end

