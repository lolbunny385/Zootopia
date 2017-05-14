sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
sudo apt-get install -y openssh-server
sudo apt-get install sshpass
sudo cp /Halbanot/git/minimal/hosts /etc/hosts
ssh-keygen -t rsa -q -f /home/"$0"/.ssh/id_rsa -P ""
sudo ssh-keygen -t rsa -q -f /home/"$0"/.ssh/id_rsa -P ""
sudo cp /Halbanot/git/minimal/ansible_hosts /etc/ansible/hosts
sudo chmod 766 /home/"$0"/.ssh
sudo chmod 766 /home/"$0"/.ssh/id_rsa
sudo service ssh restart
sudo /home/vagrant/minimal/scan.py "$0"