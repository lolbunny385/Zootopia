# Zootopia
## This Project aims to deploy CDH cluster fully automated using ansible tools.
in this project we have two way for deploying our CDH:
- FullStack  - deploying CDH with HA and wide range of machines.
- Minimal - deployinh CDH with core machines and without HA.

### let's take a look on the deployment process:
- `A` clone the repository to your local machine in path `/home/vagrant/(minimal/fullstack)/` using the command `git clone`.
  > $ git clone https://github.com/lolbunny385/Zootopia/ /home/vagrant/(minimal/fullstack)
- `B` we should bring up the machines. We are deploying the machines using vagrant tool, so you should install the latest relase of virtualbox and vagrant.
- `C` , go to path /home/vagrant/(minimal/fullstack) and press the command `$ vagrant up` ,this processs will provision for you the needed machines. 
> For fullstack deploying the machines will be :
  - manager1 - this machine running cloudera manager server
  - manager2 - this machine running CMS
  - gw1  - using as haproxy
  - gw2 - using as a ha proxy.
  - master1 -this machine running Hadoop Application ,for example : HDFS,Hbase.
  - master2 - this machine ruunning Yarn and HDFS Secondary.
  - edge - this machine running uses as a gateway to hadoop ecosystem.
  - worker[1-3] - this machines responsible like its name to working .ruuning Datanode and impalad and nodemanager.
  
  > For minimal deploying the machines will be :
  - manager1 - this machine running cloudera manager server and CMS.
  - gw1  - using as haproxy.
  - master1 -this machine running Hadoop Application ,for example : HDFS,Hbase,Yarn.
  - edge - this machine running uses as a gateway to hadoop ecosystem.
  - worker[1-2] - this machines responsible like its name to working .ruuning Datanode and impalad and nodemanager.
 
- `D`, after the machines are up ,ssh to gw1 using the command `$ vagrant ssh gw1`.Then,move to /home/vagrant/(minimal/fullstack)/playbook directory and press the command `$ansible-playbook site.yaml` - this command will deploy for you the CDH cluster.
### About the using playbooks:
- site.yaml - this is the main playbook,he responsible for running all the other playbooks.
- preinstall.yaml - This playbook responsible for configure optimization to CDH cluster and install cloudera-scm-agent and JDK on the cluster machines.
- mariadb.yaml - this playbook responsible for configure maria galera db cluster.
- ntp.yaml - this playbook responsible for configure ntp to machines.
- CM.yaml - this playbook responsible for install cloudera-scms-server and provosiong Clouder manager wizard.
- cluster_conf - this playbooks deploying the hadoop cluster ecosystem using cloudera rest api.


