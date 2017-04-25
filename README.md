# Zootopia
## This Project aims to deploy CDH cluster fully automated using ansible tools.
in this project we have two way for deploying our CDH:
- FullStack  - deploying CDH with HA and wide range of machines.
- Minimal - deploying CDH with core machines and without HA .this deployment is used for testing.

### let's take a look on the deployment process:
- `A` we should bring up the machines. We are deploying the machines using vagrant tool, so you should install the latest relase of virtualbox and vagrant.Then ,install vagrant-hostmanager plugin using the commands:
>$ vagrant plugin install vagrant-hostmanagaer
>$ vagrant plugin install vagrant-hostsupdater
- `B` clone the repository to your local machine in path `/home/vagrant/(minimal/fullstack)/` using the command `git clone`.
  > $ git clone https://github.com/lolbunny385/Zootopia/ /home/vagrant/
- `C` , go to path /home/vagrant/(minimal/fullstack) and press the command `$ vagrant up` ,this processs will provision for you the needed machines.
- `D`, after the machines are up ,ssh to gw1 using the command `$ vagrant ssh gw1`.Then,move to /home/vagrant/(minimal/fullstack)/playbook directory and press the command `$ansible-playbook site.yaml` - this command will deploy for you the CDH cluster.
> For fullstack deploying the machines will be :
  - manager1 - this machine running cloudera manager server
  - manager2 - this machine running CMS
  - gw1  - used as haproxy
  - gw2 - used as a haproxy.
  - master1 -this machine running Hadoop Application ,for example : HDFS,Hbase.
  - master2 - this machine ruunning Yarn and HDFS Secondary.
  - edge - this machine used as a gateway to hadoop ecosystem ,inclued hadoop gw applications.for example:  Hue.
  - worker[1-3] - this machines responsible like its name to working .ruuning Datanode and impalad and nodemanager.
  
  > For minimal deploying the machines will be :
  - manager1 - this machine running cloudera manager server and CMS.
  - gw1  - used as haproxy.
  - master1 -This machine running hadoop application ,for example : HDFS,Hbase,Yarn.
  - edge - this machine used as a gateway to hadoop ecosystem ,inclued hadoop gw applications.for example:  Hue.
  - worker[1-2] - this machines responsible like it's name to be a worker .ruuning Datanode and impalad and nodemanager.

### About the using playbooks:
- site.yaml - This is the main playbook,it is responsible for running all the other playbooks.
- preinstall.yaml - This playbook is responsible for configure optimization to CDH cluster and install cloudera-scm-agent and JDK on the cluster machines.
- mariadb.yaml - this playbook is responsible for configure maria galera db cluster.
- ntp.yaml - this playbook is responsible for configure ntp to machines.
- CM.yaml - this playbook is responsible for installing cloudera-scms-server and provosiong Clouder manager wizard.
- cluster_conf - this playbook is deploying the hadoop cluster ecosystem using cloudera rest api.


