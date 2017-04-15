#!/usr/bin/python
import subprocess
known_hosts = open('/home/vagrant/.ssh/known_hosts','w+')
files = open('/home/vagrant/fullstack/servers','r').readlines()
output = ""
for server in files:
        print server
        print "------------------"
	server_key = subprocess.Popen(["ssh-keyscan", server], stdout=subprocess.PIPE).communicate()[0]
        output = output + "" + server_key
       
known_hosts.write(output)
known_hosts.close()
        
