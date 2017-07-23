#!/bin/bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
sudo apt-get install -y openssh-server
sudo apt-get install sshpass
sudo cp /home/vagrant/minimal/hosts /etc/hosts
ssh-keygen -t rsa -q -f /home/vagrant/.ssh/id_rsa -P ""
sudo ssh-keygen -t rsa -q -f /home/vagrant/.ssh/id_rsa -P ""
sudo cp /home/vagrant/minimal/ansible_hosts /etc/ansible/hosts
sudo service ssh restart
sudo chmod 766 /home/vagrant/.ssh
sudo chmod 766 /home/vagrant/.ssh/id_rsa
#files=`cat /home/vagrant/minimal/servers`
#cho $files
#for l in $files 
#do
#  sudo ssh-keyscan -H $l >> /home/vagrant/.ssh/known_hosts
#done
#sudo chown vagrant:vagrant /home/vagrant/.ssh/known_hosts
sudo service ssh restart
sudo /home/vagrant/minimal/scan.py
