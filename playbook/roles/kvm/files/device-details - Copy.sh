#!/bin/bash
devices=(`lspci | awk '/VMware/ { gsub(/[:.]/, "_"); print $1}'`)
vms=(`awk '/^ [0-9]/ { print $2 }`)
for device in $devices
do
	xml=`virsh nodedev-dumpxml pci_0000_$device`
	domain=`awk '/domain/ BEGIN {FS = "[<>]" } ; {print $3}' $xml`
	bus=`awk '/bus/ BEGIN {FS = "[<>]" } ; {print $3}'`
	slot=`awk '/slot/ BEGIN {FS = "[<>]" } ; {print $3}'`
	function=`awk '/function/ BEGIN {FS = "[<>]" } ; {print $3}'`
	address="<address type='pci' domain='$domain' bus='$bus' slot='$slot' function='$function'/>"
	for vm in vms
	do
		if ["`virsh dumpxml $vm | grep $address`" = ""]; then
			attached=true
			break
		fi
		attached=false
	if [ "$attached" = false ]
		"<interface type='hostdev' managed='yes'/>
  <source>
    $address
  </source>
</interface>" > /tmp/interface.xml
virsh attach-device 


	
	
	
