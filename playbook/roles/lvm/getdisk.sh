#! /bin/bash
func()
{
	z=`sudo lshw -C disk  | grep -i '/dev'`
	k=`echo $z | tail -1`
        echo $k
}
func
