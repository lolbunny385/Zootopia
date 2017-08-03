#!/usr/bin/bash
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
sudo apt-get install -y openssh-server
ssh-keygen -t rsa -q -f $HOME/.ssh/id_rsa -P ""
sudo cp $HOME/BenchmarksEdition/ansible_hosts /etc/ansible/hosts
sudo service ssh restart
sudo chmod 777 ~/.ansible -R
sudo chmod 766 ~/.ssh
sudo chmod 766 ~/.ssh/id_rsa
sudo service ssh restart
sudo $HOME/BenchmarksEdition/scan.py
