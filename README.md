# Zootopia
## This Project aims to deploy CDH cluster fully automated using ansible tools.

<<<<<<< HEAD
let's take a look on the deployment process:
=======
#### let's take a look on the deployment process:
>>>>>>> f345b557e47791df903f1c5c032833d23f7d8d83
- `A` clone the repository to your local machine in path `/home/vagrant/hosts/` using the command `git clone`.
  > $ git clone https://github.com/lolbunny385/Zootopia/ /home/vagrant/hosts
- `B` we should bring up the machines. We are deploying the machines using vagrant tool, so you should install the latest relase of virtualbox and vagrant.
- `C` , go to path /home/vagrant/hosts and press the command `$ vagrant up` ,this processs will provision for you the needed machines:
  - manager1
  - manager2
  - gw1
  - gw2
  - master1
  - master2
  - edge
  - worker[1-3]
- `D`, after the machines are up ,ssh to gw1 using the command `$ vagrant ssh gw1`.Then,move to /home/vagrant/hosts/playbook directory and press the command `$ansible-playbook site.yaml` - this command will deploy for you the CDH cluster.
<<<<<<< HEAD

=======
### About the using playbooks:
- site.yaml - this is the main playbook,he responsible for running all the other playbooks.
- preinstall.yaml - This playbook responsible for configure optimization to CDH cluster and install cloudera-scm-agent and JDK on the cluster machines.
- mariadb.yaml - this playbook responsible for configure maria galera db cluster.
- ntp.yaml - this playbook responsible for configure ntp to machines.
- CM.yaml - this playbooks responsible for install cloudera-scms-server and provosiong Clouder manager wizard.
- 
>>>>>>> f345b557e47791df903f1c5c032833d23f7d8d83
