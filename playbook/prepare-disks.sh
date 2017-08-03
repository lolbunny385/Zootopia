#!/bin/bash
for disk in $1
do
	i = 1
	parted $disk rm *
	parted $disk mklabel gpt
	parted --align optimal $disk mkpart primary ext4 0% 100%
	"$disk  /data/$i  ext4  defaults,noatime  0  0" >> /etc/fstab
done
mount -a
