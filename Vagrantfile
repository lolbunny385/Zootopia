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
      srv.vm.network "private_network", ip: servers["ip"]
      srv.vm.provider :virtualbox do |vb|
        vb.name = servers['name']
        vb.memory = servers['ram']
        vb.gui = true
        vb.cpus = servers['cpu']
      end
      srv.vm.synced_folder servers['folder'], "/home/vagrant/hosts"
      srv.vm.provision :shell, :path  => servers['provision']
    end
  end
end

