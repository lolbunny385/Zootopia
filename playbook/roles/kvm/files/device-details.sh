#!/bin/bash
devices=(`lspci | awk '/Virtual Function/ { gsub(/[:.]/, "_"); print $1}'`)
virsh nodedev-dumpxml pci_0000_${devices[$1]} > /tmp/xml
domain=`cat /tmp/xml | awk 'BEGIN {FS = "[<>]"} ; /domain/ {print $3}'`
bus=`cat /tmp/xml | awk 'BEGIN {FS = "[<>]"} ; /bus/ {print $3}'`
slot=`cat /tmp/xml | awk 'BEGIN {FS = "[<>]"} ; /slot/ {print $3}'`
function=`cat /tmp/xml | awk 'BEGIN {FS = "[<>]" } ; /function/ {print $3}'`
echo "<interface type='hostdev' managed='yes'/>
  <source>
    <address type='pci' domain='$domain' bus='$bus' slot='$slot' function='$function'/>
  </source>
</interface>" > /tmp/interface.xml
virsh attach-device vm$1 /tmp/interface.xml --config

