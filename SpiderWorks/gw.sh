#!/usr/bin/python
import os
os.system('sudo apt-get install -y software-properties-common')
os.system('sudo apt-add-repository ppa:ansible/ansible')
os.system('sudo apt-get update')
os.system('sudo apt-get install -y ansible')
os.system('sudo apt-get install openssh-server')
os.system('ssh-keygen -t rsa -q -f /home/vagrant/.ssh/id_rsa -P ""')
os.system('sudo cp /home/vagrant/hosts/hosts /etc/hosts')
os.system('sudo cp /home/vagrant/hosts/ansible_hosts /etc/ansible/hosts')
os.system('sudo service ssh restart')
os.system('sudo chmod 777 ~/.ansible -R	')
os.system('sudo /home/vagrant/hosts/scan.py')
os.system('sudo ansible-playbook /home/vagrant/hosts/playbook/pubkey.yaml -e "ansible_user=vagrant ansible_sudo_pass=vagrant ansible_ssh_pass=vagrant "')