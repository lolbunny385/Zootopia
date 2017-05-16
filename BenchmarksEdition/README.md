# Zootopia
## This Project aims to deploy CDH cluster fully automated using ansible tools.

### This Directory will help you to deploy cloudera minimal for benchmarks tests
- `A` clone the repository to your local machine in path `/home/vagrant/hosts/` using the command `git clone`.
  > $ git clone https://github.com/lolbunny385/Zootopia/ /home/vagrant/hosts
- `B` we should bring up the machines. We are deploying the machines using vagrant tool, so you should install the latest relase of virtualbox and vagrant.
- `C` , go to path /home/vagrant/hosts and press the command `$ vagrant up` ,this processs will provision for you the needed machines:
  - manager - this machine running cloudera manager server and CMS
  - master -this machine running Hadoop Application ,for example : HDFS,Hbase.
  - workers - this machines responsible like its name to working .ruuning Datanode and impalad and nodemanager.
- `D`, after the machines are up ,ssh to gw1 using the command `$ vagrant ssh gw1`.Then,move to /home/vagrant/hosts/playbook directory and press the command `$ansible-playbook site.yaml` - this command will deploy for you the CDH cluster.

> enjoy !
