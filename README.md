# Hadoop-Ansible
## This Automation will deploy Hadoop application using Ansible CM

#### Deployment process:
- Install Ansible with the command: ` sudo apt-get install ansible` , Ensure Ansible version >= 2.1
- Clone the repository to /etc/ansible `git clone <git url>`
- Add repositories by type the command:`cp /etc/ansible/sources.list /etc/apt/sources.list | apt update`
- Configure correctly all the variables in group\_vars
- Update the Ansible inventory and the file /etc/ansible/playbook/hosts file, which will be sent to the hosts' /etc/hosts
- Install cowsay for some extra fun! `sudo apt-get install cowsay`
- Finally run the command ` ansible-playbook /etc/ansible/playbook/Install.yaml` ,this will deploy the Hadoop application for you.


#### About the using playbooks:
- Install.yml - Performs all playbooks neccesary to deploy a cluster
- preinstall.yaml - This playbook responsible for configure optimization to CDH cluster and install cloudera-scm-agent and JDK on the clust.
- mariadb.yaml - This playbook responsible for configure maria galera db cluster.
- ntp.yaml - This playbook responsible for configure ntp to machines.
- CM.yaml - This playbooks responsible for install cloudera-scms-server and provosiong Clouder manager wizard.
- conf_cluster.yaml - Imports a cluster template to Cloudera Manager, Then deploys the cluster from that template.

