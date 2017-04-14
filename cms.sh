#!/bin/bash
#curl -X GET http://admin:admin@192.168.0.102:7180/api/v12/hosts -sb -H "Accept: application/json" | grep -i '"hostname" : "manager2"' -B 3 | grep -i "hostid" > text.txt
curl -X PUT http://admin:admin@192.168.0.102:7180/api/v12/cm/service/    -H "Content-Type: application/json" -d @prodcms.json
#echo `cut -f 4 -d '"' text.txt` > text.txt
#sleep 1m
sudo ./scan.py
#sleep 1m
ansible-playbook hostid.yaml -s -e "ansible_ssh_pass=vagrant ansible_sudo_pass=vagrant"
curl -X POST http://admin:admin@192.168.0.102:7180/api/v12/cm/service/commands/start -d @startroles.json   -H "Content-Type: application/json"
sleep 3m
ansible journal -m shell -a "mkdir /qjm" -e "ansible_ssh_pass=vagrant" -s
ansible journal -m shell -a "chmod 777 /qjm" -e "ansible_ssh_pass=vagrant" -s
curl -X POST -H "Content-Type: application/json" -d @template.json http://admin:admin@192.168.0.102:7180/api/v12/cm/importClusterTemplate?addRepositories=true


