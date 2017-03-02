#!/usr/bin/python
import os
os.system('sudo apt-get update cache')
os.system('sudo apt-get install -y git')
os.system('sudo cp /home/vagrant/hosts/hosts /etc/hosts')
os.system('sudo mkdir /home/vagrant/.ssh')
os.system('sudo cp /home/vagrant/hosts/id_rsa /home/vagrant/.ssh/athorized_keys')
os.system('sudo service ssh restart')

