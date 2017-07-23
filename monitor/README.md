# Zootopia
## This Project aims to deploy CDH cluster fully automated using ansible tools.
### this role will deploy monitor system for you . what is the monitor system include:
- telegraf service - collector metrics from servers.
- influxdb - time series database that will aggregate the metrics.
- grafana - dashboard that will print the metrics on graphs in a pretty UI screen.

### About the using playbooks:
- main.yml - this playbook is reponsinle for manage the installation. he calls for each playbook in a time.
- telegraf.yml - this playbook is responsible for installing telegraf agent on server and config telegraf conf file.
- dashbaord.yml - this playbook is responisble for installing grafana and import Datasource(Influxdb) and dashboard.
- influxdb.yml - this playbook is responisble for installing influxdb and create database "CDH" for him.
