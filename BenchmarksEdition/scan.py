#!/usr/bin/python
import subprocess
import os
home= os.environ['HOME']
known_hosts = open( home + '/.ssh/known_hosts','w+')
files = open( home + '/BenchmarksEdition/servers','r').readlines()
output = ""
for server in files:
        print server
        print "------------------"
	server_key = subprocess.Popen(["ssh-keyscan", server], stdout=subprocess.PIPE).communicate()[0]
        output = output + "" + server_key
       
known_hosts.write(output)
known_hosts.close()
        
