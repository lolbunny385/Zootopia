# Zootopia
### this role will deploy monitor system for Benchmarking. what is the monitor system include:

- telegraf service - collect metrics from servers. the telegraf include a config file the will send tags with the metrics, you should edit the tags for each test.The editing will be in telegraf.conf
- influxdb - time series database that will aggregate the metrics.
- grafana - dashboard that will print the metrics on graphs in a pretty UI screen.

### About the using playbooks:
- main.yml - this playbook is reponsinle for manage the installation. he calls for each playbook in a time.
- telegraf.yml - this playbook is responsible for installing telegraf agent on server and config telegraf conf file.
- dashbaord.yml - this playbook is responisble for installing grafana and import Datasource(Influxdb) and dashboard.
- influxdb.yml - this playbook is responisble for installing influxdb and create database "CDH" for him.


### Requirements for deploying the monitor system
- Edit your group_vars file with the  correct variable for your deployment.
- Copy the group_vars file to /etc/ansible/group_vars.
>> For running the playbooks , you should run the command: ansible-playbook deploy-monitoring.yml

